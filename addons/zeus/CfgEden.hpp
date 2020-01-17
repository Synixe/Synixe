class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class PREFIX {
                class Attributes {
                    class GVAR(isZeus) {
                        displayName = "Zeus";
                        tooltip = "Make this unit a curator";
                        property = QGVAR(isZeus);
                        control = "Checkbox";
                        expression = QUOTE(if (_value) then {[_this] call FUNC(assignZeus)});
                        defaultValue = "false";
                        condition = "logicModule + objectBrain";
                    };
                };
            };
        };
    };
};
