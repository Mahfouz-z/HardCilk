package chisel3.interface.net

import java.net._
import strenc._
import chisel3.interface.ClientHandler

class Server(val portNumber: Int) extends Runnable {
  private val serverSocket = new ServerSocket(portNumber)
  private var stopped = false

  def stop(): Unit = {
    serverSocket.close()
  }

  def run(): Unit = {
    while (!serverSocket.isClosed()) {
      try {
        val socket = serverSocket.accept()
        new Thread(new Runnable {
          def run(): Unit = {
            new ClientHandler(
              new ArgumentInputStream(socket.getInputStream()),
              new ArgumentOutputStream(socket.getOutputStream())
            ).run()
            socket.close()
          }
        }).start()
      } catch {
        case e: SocketException => { /* OK */ }
      }
    }
  }
}
