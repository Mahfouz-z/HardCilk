package strenc

private[strenc] trait ED_Primitives {
  // built-in encoders

  implicit def longEncoder = new Encoder[Long] {
    def encode(x: Long, os: ArgumentOutputStream): Unit = {
      os.pushLong(x)
      os.pushField()
    }
  }

  implicit def byteEncoder = new Encoder[Byte] {
    def encode(x: Byte, os: ArgumentOutputStream): Unit = {
      os.push(x.toLong)
    }
  }

  implicit def intEncoder = new Encoder[Int] {
    def encode(x: Int, os: ArgumentOutputStream): Unit = {
      os.push(x.toLong)
    }
  }

  implicit def booleanEncoder = new Encoder[Boolean] {
    def encode(x: Boolean, os: ArgumentOutputStream): Unit =
      os.pushByte(if (x) 'T' else 'F')
  }

  implicit def stringEncoder = new Encoder[String] {
    def encode(x: String, os: ArgumentOutputStream): Unit =
      os.pushStringEncodeLength(x)
  }

  implicit def byteArrayEncoder = new Encoder[Array[Byte]] {
    def encode(x: Array[Byte], os: ArgumentOutputStream): Unit =
      os.pushBytesEncodeLength(x)
  }

  implicit def doubleEncoder = new Encoder[Double] {
    def encode(x: Double, os: ArgumentOutputStream): Unit = {
      os.pushDouble(x)
      os.pushField()
    }
  }

  implicit def floatEncoder = new Encoder[Float] {
    def encode(x: Float, os: ArgumentOutputStream): Unit = {
      os.push(x.toDouble)
    }
  }

  implicit def optionEncoder[T: Encoder] = new Encoder[Option[T]] {
    def encode(x: Option[T], os: ArgumentOutputStream): Unit = {
      os.push(x.nonEmpty)
      if (x.nonEmpty) {
        os.push(x.get)
      }
    }
  }

  implicit def seqEncoder[T: Encoder] = new Encoder[Seq[T]] {
    def encode(x: Seq[T], os: ArgumentOutputStream): Unit = {
      os.pushLong(x.length)
      os.pushSubfield()
      x.foreach {
        case x => {
          os.push(x)
        }
      }
    }
  }

  implicit def tuple1Encoder[T1: Encoder] =
    new Encoder[Tuple1[T1]] {
      def encode(x: Tuple1[T1], os: ArgumentOutputStream): Unit = {
        os.push(x._1)
      }
    }

  implicit def tuple2Encoder[T1: Encoder, T2: Encoder] =
    new Encoder[Tuple2[T1, T2]] {
      def encode(x: Tuple2[T1, T2], os: ArgumentOutputStream): Unit = {
        os.push(x._1)
        os.push(x._2)
      }
    }

  implicit def tuple3Encoder[T1: Encoder, T2: Encoder, T3: Encoder] =
    new Encoder[Tuple3[T1, T2, T3]] {
      def encode(x: Tuple3[T1, T2, T3], os: ArgumentOutputStream): Unit = {
        os.push(x._1)
        os.push(x._2)
        os.push(x._3)
      }
    }

  implicit def tuple4Encoder[
      T1: Encoder,
      T2: Encoder,
      T3: Encoder,
      T4: Encoder
  ] =
    new Encoder[Tuple4[T1, T2, T3, T4]] {
      def encode(x: Tuple4[T1, T2, T3, T4], os: ArgumentOutputStream): Unit = {
        os.push(x._1)
        os.push(x._2)
        os.push(x._3)
        os.push(x._4)
      }
    }

  // built-in decoders

  implicit def longDecoder = new Decoder[Long] {
    def decode(is: ArgumentInputStream): Long = {
      val result = is.popLong()
      is.popField()
      result
    }
  }
  implicit def byteDecoder = new Decoder[Byte] {
    def decode(is: ArgumentInputStream): Byte = is.pop[Long].toByte
  }

  implicit def intDecoder = new Decoder[Int] {
    def decode(is: ArgumentInputStream): Int = is.pop[Long].toInt
  }

  implicit def booleanDecoder = new Decoder[Boolean] {
    def decode(is: ArgumentInputStream): Boolean = is.popByte() == 'T'
  }

  implicit def stringDecoder = new Decoder[String] {
    def decode(is: ArgumentInputStream): String = is.popStringDecodeLength()
  }

  implicit def byteArrayDecoder = new Decoder[Array[Byte]] {
    def decode(is: ArgumentInputStream): Array[Byte] = is.popByteDecodeLength()
  }

  implicit def doubleDecoder = new Decoder[Double] {
    def decode(is: ArgumentInputStream): Double = {
      val result = is.popDouble()
      is.popField()
      result
    }
  }

  implicit def floatDecoder = new Decoder[Float] {
    def decode(is: ArgumentInputStream): Float = is.pop[Double].toFloat
  }

  implicit def optionDecoder[T: Decoder] = new Decoder[Option[T]] {
    def decode(is: ArgumentInputStream): Option[T] = {
      val nonEmpty = is.pop[Boolean]
      if (nonEmpty) {
        Some(is.pop[T])
      } else
        None
    }
  }

  implicit def seqDecoder[T: Decoder] = new Decoder[Seq[T]] {
    def decode(is: ArgumentInputStream): Seq[T] = {
      val len = is.popLong().toInt
      is.popSubfield()
      Seq.tabulate(len) {
        case _: Int => {
          is.pop[T]
        }
      }
    }
  }

  implicit def tuple1Decoder[T1: Decoder] = new Decoder[Tuple1[T1]] {
    def decode(is: ArgumentInputStream): Tuple1[T1] = Tuple1(is.pop[T1])
  }

  implicit def tuple2Decoder[T1: Decoder, T2: Decoder] =
    new Decoder[Tuple2[T1, T2]] {
      def decode(is: ArgumentInputStream): Tuple2[T1, T2] = {
        (is.pop[T1], is.pop[T2])
      }
    }

  implicit def tuple3Decoder[T1: Decoder, T2: Decoder, T3: Decoder] =
    new Decoder[Tuple3[T1, T2, T3]] {
      def decode(is: ArgumentInputStream): Tuple3[T1, T2, T3] = {
        (is.pop[T1], is.pop[T2], is.pop[T3])
      }
    }

  implicit def tuple4Decoder[
      T1: Decoder,
      T2: Decoder,
      T3: Decoder,
      T4: Decoder
  ] =
    new Decoder[Tuple4[T1, T2, T3, T4]] {
      def decode(is: ArgumentInputStream): Tuple4[T1, T2, T3, T4] = {
        (is.pop[T1], is.pop[T2], is.pop[T3], is.pop[T4])
      }
    }
}
