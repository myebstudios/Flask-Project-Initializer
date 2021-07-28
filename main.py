# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

class Bridge(QObject):

    @Slot(list, result=str)
    def sayHello(self, names):
        print(names)
    
    @Slot(str, result=str)
    def createProject(self, title):
        print(f'Creating project: {title}')

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    bridge = Bridge()

    context = engine.rootContext()
    context.setContextProperty("backend", bridge)

    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
