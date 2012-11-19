/*
  Copyright (C) 2012 Klarälvdalens Datakonsult AB, a KDAB Group company, info@kdab.com
  Author: Kevin Krammer, krake@kdab.com
  Author: Tobias Koenig, tokoe@kdab.com

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
*/

import QtGui 1.0

MainWindow {
  windowTitle: textEdit.modified ? qsTr("Declarative Widget Editor *modified*") : qsTr("Declarative Widget Editor")

  size: Qt.size(500, 300)

  Dialog {
    id: myDialog

    size: Qt.size(300, 200)
    visible: false

    VBoxLayout {
      Label {
        text: "Hello World"
      }
      DialogButtonBox {
        standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel

        onAccepted: myDialog.accept()
        onRejected: myDialog.reject()
      }
    }
  }

  MenuBar {
    Menu {
      title: qsTr("File")

      Action {
        text: qsTr("New")
        onTriggered: {
          var result = myDialog.exec()
          console.log("result="+result)
        }
      }

      Action {
        text: qsTr("Save")
      }

      Separator {}

      Action {
        text: qsTr("Print")
      }

      Separator {}

      Action {
        text: qsTr("Close")
        onTriggered: Qt.quit()
      }
    }

    Menu {
      title: qsTr("Edit")

      Action {
        text: qsTr("Undo")
        onTriggered: textEdit.undo()
      }

      Action {
        text: qsTr("Redo")
        onTriggered: textEdit.redo()
      }

      Separator {}

      Action {
        id: cutAction
        text: qsTr("Cut")
        onTriggered: textEdit.cut()
      }

      Action {
        id: copyAction
        text: qsTr("Copy")
        onTriggered: textEdit.copy()
      }

      Action {
        id: pasteAction
        text: qsTr("Paste")
        onTriggered: textEdit.paste()
      }

      Separator {}

      Action {
        text: qsTr("Select All")
        onTriggered: textEdit.selectAll()
      }
    }

    Menu {
      title: qsTr("View")

      Action {
        text: qsTr("Enlarge Font")
        onTriggered: textEdit.zoomIn()
      }

      Action {
        text: qsTr("Shrink Font")
        onTriggered: textEdit.zoomOut()
      }
    }

    Menu {
      title: qsTr("Help")

      Action {
        text: qsTr("About")
        onTriggered: MessageBox.about(0, qsTr("About Declarative Widgets Editor Example"),
                                      qsTr("This is an example of a simple text editor written in QML using DeclarativeWidgets"))
      }

      Action {
        text: qsTr("About Qt")
        onTriggered: MessageBox.aboutQt(0, qsTr("About Qt"))
      }
    }
  }

  ToolBar {
    Action {
      text: qsTr("New")
    }

    Separator {}

    Label {
      text: "Zoom"
    }
  }

  TextEdit {
    id: textEdit

    contextMenuPolicy: Qt.ActionsContextMenu

    ActionItem {
      action: cutAction
    }

    ActionItem {
      action: copyAction
    }

    ActionItem {
      action: pasteAction
    }
  }

  StatusBar {
    Label {
      StatusBar.stretch: 2
      text: "Pos:"
    }
  }
}