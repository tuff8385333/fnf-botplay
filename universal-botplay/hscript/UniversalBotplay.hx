// UniversalBotplay.hx (HScript)
// For engines that support runtime HScript execution.

var botplayText:String = "BOTPLAY (UNIVERSAL MOD)";

function setIfExists(target:Dynamic, field:String, value:Dynamic):Void {
    if (target != null && Reflect.hasField(target, field)) {
        Reflect.setField(target, field, value);
    }
}

function applyUniversalBotplay():Void {
    var state:Dynamic = game;

    if (state == null) return;

    // Frequently used botplay flags across forks.
    setIfExists(state, "cpuControlled", true);
    setIfExists(state, "botPlay", true);
    setIfExists(state, "botplay", true);

    // Optional text field.
    if (Reflect.hasField(state, "botplayTxt")) {
        var txt:Dynamic = Reflect.field(state, "botplayTxt");
        if (txt != null) {
            setIfExists(txt, "visible", true);
            setIfExists(txt, "text", botplayText);
        }
    }

    if (Reflect.hasField(state, "botPlayTxt")) {
        var txt2:Dynamic = Reflect.field(state, "botPlayTxt");
        if (txt2 != null) {
            setIfExists(txt2, "visible", true);
            setIfExists(txt2, "text", botplayText);
        }
    }
}

function onCreatePost():Void {
    applyUniversalBotplay();
}

function onUpdatePost(elapsed:Float):Void {
    applyUniversalBotplay();
}
