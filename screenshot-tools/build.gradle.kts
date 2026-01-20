plugins {
    kotlin("jvm") version "1.9.22"
}

group = "com.zklsol.noir.screenshots"
version = "1.0.0"

repositories {
    mavenCentral()
    maven("https://packages.jetbrains.team/maven/p/ij/intellij-dependencies")
}

dependencies {
    testImplementation("com.intellij.remoterobot:remote-robot:0.11.22")
    testImplementation("com.intellij.remoterobot:remote-fixtures:0.11.22")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.10.0")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.10.0")
    testImplementation("com.squareup.okhttp3:okhttp:4.12.0")
}

tasks.test {
    useJUnitPlatform()
    systemProperty("robot.host", "127.0.0.1")
}

kotlin {
    jvmToolchain(17)
}
