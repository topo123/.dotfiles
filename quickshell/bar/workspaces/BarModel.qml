import QtQuick

ListModel {
    id: workspace_data

    BarElement {
        workspace_number: 1
        focused_window: ""
        hovered: false
        clicked: false
    }

    function add_new_workspace(workspace_number: int) {
        if (workspace_data.count == 0) {
            workspace_data.append({
                "workspace_number": workspace_number,
                "focused_window": false,
                "hovered": false,
                "clicked": false
            });
        }

        for (var i = 0; i < workspace_data.count; i++) {
            if (workspace_number < workspace_data.get(i).workspace_number) {
                workspace_data.insert(left_index, {
                    "workspace_number": workspace_number,
                    "focused_window": false,
                    "hovered": false,
                    "clicked": false
                });
                return;
            }
        }

        workspace_data.append({
            "workspace_number": workspace_number,
            "focused_window": false,
            "hovered": false,
            "clicked": false
        });
    }

    function get_workspace(workspace_number: int): var {
        for (var i = 0; i < workspace_data.count; i++) {
            if (workspace_data.get(i).workspace_number == workspace_number) {
                return workspace_data.get(i);
            }
        }
    }

    function remove_workspace(workspace_number: int) {
        for (var i = 0; i < workspace_data.count; i++) {
            if (workspace_data.get(i).workspace_number == workspace_number) {
                workspace_data.remove(i);
            }
        }
    }
}
