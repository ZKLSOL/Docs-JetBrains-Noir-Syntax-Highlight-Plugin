package screenshots

import com.intellij.remoterobot.RemoteRobot
import com.intellij.remoterobot.fixtures.CommonContainerFixture
import com.intellij.remoterobot.search.locators.byXpath
import com.intellij.remoterobot.utils.waitFor
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test
import java.awt.image.BufferedImage
import java.io.File
import java.time.Duration
import javax.imageio.ImageIO

class ScreenshotRunner {
    companion object {
        private lateinit var robot: RemoteRobot
        private const val OUTPUT_DIR = "../output"
        private const val VERSION = "0.1.0"

        @JvmStatic
        @BeforeAll
        fun setup() {
            robot = RemoteRobot("http://127.0.0.1:8082")
            File(OUTPUT_DIR).mkdirs()
        }
    }

    @Test
    fun captureSyntaxHighlighting() {
        openFile("src/main.nr")
        waitFor(Duration.ofSeconds(2))
        captureScreenshot("syntax-keywords-v$VERSION")
    }

    @Test
    fun captureCodeCompletion() {
        openFile("src/main.nr")
        waitFor(Duration.ofSeconds(1))

        val editor = robot.find(CommonContainerFixture::class.java, byXpath("//div[@class='EditorComponentImpl']"))
        editor.click()

        robot.keyboard {
            key(java.awt.event.KeyEvent.VK_END)
            enterText("\nfn demo() {\n    let x: ")
        }

        waitFor(Duration.ofSeconds(1))
        robot.keyboard { hotKey(java.awt.event.KeyEvent.VK_CONTROL, java.awt.event.KeyEvent.VK_SPACE) }
        waitFor(Duration.ofSeconds(2))

        captureScreenshot("lsp-completion-v$VERSION")
    }

    @Test
    fun captureHover() {
        openFile("src/main.nr")
        waitFor(Duration.ofSeconds(1))

        val editor = robot.find(CommonContainerFixture::class.java, byXpath("//div[@class='EditorComponentImpl']"))
        editor.moveMouse()
        waitFor(Duration.ofSeconds(2))

        captureScreenshot("lsp-hover-v$VERSION")
    }

    @Test
    fun captureTestGutter() {
        openFile("src/main.nr")
        waitFor(Duration.ofSeconds(1))

        val editor = robot.find(CommonContainerFixture::class.java, byXpath("//div[@class='EditorComponentImpl']"))
        robot.keyboard {
            hotKey(java.awt.event.KeyEvent.VK_CONTROL, java.awt.event.KeyEvent.VK_G)
        }
        robot.keyboard { enterText("45") }
        robot.keyboard { key(java.awt.event.KeyEvent.VK_ENTER) }
        waitFor(Duration.ofSeconds(1))

        captureScreenshot("limitations-test-gutter-v$VERSION")
    }

    @Test
    fun captureSettings() {
        robot.keyboard {
            hotKey(java.awt.event.KeyEvent.VK_META, java.awt.event.KeyEvent.VK_COMMA)
        }
        waitFor(Duration.ofSeconds(2))

        val searchField = robot.find(CommonContainerFixture::class.java, byXpath("//div[@class='SettingsSearch']//input"))
        searchField.click()
        robot.keyboard { enterText("Noir") }
        waitFor(Duration.ofSeconds(1))

        captureScreenshot("settings-app-v$VERSION")

        robot.keyboard { key(java.awt.event.KeyEvent.VK_ESCAPE) }
    }

    @Test
    fun captureActionsMenu() {
        robot.keyboard {
            hotKey(java.awt.event.KeyEvent.VK_SHIFT, java.awt.event.KeyEvent.VK_SHIFT)
        }
        waitFor(Duration.ofSeconds(1))
        robot.keyboard { enterText("Noir") }
        waitFor(Duration.ofSeconds(1))

        captureScreenshot("actions-menu-v$VERSION")

        robot.keyboard { key(java.awt.event.KeyEvent.VK_ESCAPE) }
    }

    private fun openFile(path: String) {
        robot.keyboard {
            hotKey(java.awt.event.KeyEvent.VK_META, java.awt.event.KeyEvent.VK_SHIFT, java.awt.event.KeyEvent.VK_O)
        }
        waitFor(Duration.ofSeconds(1))
        robot.keyboard { enterText(path) }
        waitFor(Duration.ofSeconds(1))
        robot.keyboard { key(java.awt.event.KeyEvent.VK_ENTER) }
        waitFor(Duration.ofSeconds(2))
    }

    private fun captureScreenshot(name: String) {
        val screenshot = robot.getScreenshot()
        val file = File("$OUTPUT_DIR/$name.png")
        ImageIO.write(screenshot, "png", file)
        println("Screenshot saved: ${file.absolutePath}")
    }
}
