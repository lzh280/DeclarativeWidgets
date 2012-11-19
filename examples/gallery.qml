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

TabWidget {
  windowTitle: qsTr("Widget Gallery")
  size: Qt.size(700, 500)

  Widget {
    TabWidget.label: "Buttons"

    VBoxLayout {
      PushButton {
        text: qsTr("PushButton")
      }

      ToolButton {
        text: qsTr("ToolButton")
      }

      RadioButton {
        text: qsTr("RadioButton")
      }

      CheckBox {
        text: qsTr("CheckBox")
      }

      CommandLinkButton {
        text: qsTr("CommandLinkButton")
        description: qsTr("A short description")
      }

      DialogButtonBox {
        standardButtons: DialogButtonBox.Save | DialogButtonBox.Cancel
      }
    }
  }

  Widget {
    TabWidget.label: "ItemViews"

    VBoxLayout {
      ListView {
        model: _fileSystemModel
      }
      TreeView {
        model: _fileSystemModel
      }
      TableView {
        model: _fileSystemModel
      }
      ColumnView {
        model: _fileSystemModel
      }
    }
  }

  Widget {
    TabWidget.label: "Containers"

    VBoxLayout {
      GroupBox {
        title: "GroupBox"
        minimumWidth: 100
        minimumHeight: 100
      }
      ScrollArea {
        Widget {
          size: Qt.size(800, 800)
        }
      }
      Frame {
        frameShape: Frame.Panel
        frameShadow: Frame.Sunken
        minimumWidth: 100
        minimumHeight: 100
      }
      StackedWidget {
        Label {
          text: "Page 1"
        }
        Label {
          text: "Page 2"
        }
      }
    }
  }

  Widget {
    TabWidget.label: "Input Widgets"

    VBoxLayout {
      LineEdit {
        text: qsTr("LineEdit")
        onTextChanged: console.log("Types: " + text)
      }

      TextEdit {
        plainText: qsTr("TextEdit")
      }

      PlainTextEdit {
        plainText: qsTr("PlainTextEdit")
      }

      SpinBox {}

      DoubleSpinBox {}

      TimeEdit {}

      DateEdit {}

      DateTimeEdit {}

      Dial {}

      ScrollBar {
        minimum: 0
        maximum: 100
        value: 50
        orientation: Qt.Horizontal
      }

      Slider {
        minimum: 0
        maximum: 100
        value: 50
        orientation: Qt.Horizontal
      }
    }
  }

  Widget {
    TabWidget.label: "Display Widgets"

    VBoxLayout {
      Label {
        text: qsTr("Label")
      }

      TextBrowser {
        openExternalLinks: true
        html: "<html><body>TextBrowser <a href=\"http://www.kde.org\">Coolest project ever</a></body></html>"
      }

      CalendarWidget {}

      LCDNumber {
        value: 42
      }

      ProgressBar {
        minimum: 0
        maximum: 100
        value: 42
        textVisible: true
      }

      WebView {
        url: "http://www.kdab.com"
      }
    }
  }
}