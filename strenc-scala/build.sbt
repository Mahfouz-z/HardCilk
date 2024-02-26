ThisBuild / scalaVersion := "2.13.8"
ThisBuild / organization := "jnbrq"
ThisBuild / version := "0.1.0"

lazy val strenc = (project in file("."))
  .settings(
    name := "strenc-scala",
    libraryDependencies ++= Seq(
      "org.scalatest" %% "scalatest" % "3.2.11" % Test
    )
  )

