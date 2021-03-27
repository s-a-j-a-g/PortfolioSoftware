from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QMessageBox
from PySide6.QtGui import QCloseEvent

class Example(QWidget):
    def __init__(self):
        super().__init__()

        self.setup()

    def setup(self):
        btn_quit = QPushButton('Force Quit', self)
        btn_quit.clicked.connect(QApplication.instance().quit)
        btn_quit.resize(btn_quit.sizeHint())
        btn_quit.move(98,100)

        self.setGeometry(100, 100, 200, 150)
        self.setWindowTitle('Window Example')

        self.show()

    def closeEvent(self, event: QCloseEvent):
        reply = QMessageBox.question(self, 'Message', "Are you sure you want to quit?",
        QMessageBox.Yes | QMessageBox.No, QMessageBox.No)

        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()


def run():
    app = QApplication([])

    ex = Example()

    app.exec_()

if __name__ == "__main__":
    run()
