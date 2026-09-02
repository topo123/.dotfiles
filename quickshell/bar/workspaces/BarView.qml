import QtQuick

ListView {
    layoutDirection: Qt.LeftToRight
    model: BarModel {
        id: workspace_model
    }
    delegate: component BarDelegate: Rectangle {
    }
}
