package;

/**
 * Source-level universal botplay helper.
 *
 * Usage in PlayState:
 *   override public function create() {
 *     super.create();
 *     UniversalBotplay.apply(this);
 *   }
 *
 *   override public function update(elapsed:Float) {
 *     UniversalBotplay.apply(this);
 *     super.update(elapsed);
 *   }
 */
class UniversalBotplay {
    public static var botplayText(default, set):String = "BOTPLAY (UNIVERSAL MOD)";

    static function set_botplayText(v:String):String {
        return botplayText = v;
    }

    public static function apply(state:Dynamic):Void {
        if (state == null) return;

        setIfExists(state, "cpuControlled", true);
        setIfExists(state, "botPlay", true);
        setIfExists(state, "botplay", true);

        applyTextIfExists(state, "botplayTxt");
        applyTextIfExists(state, "botPlayTxt");
    }

    static function setIfExists(target:Dynamic, field:String, value:Dynamic):Void {
        if (Reflect.hasField(target, field)) {
            Reflect.setField(target, field, value);
        }
    }

    static function applyTextIfExists(state:Dynamic, field:String):Void {
        if (!Reflect.hasField(state, field)) return;

        var textObj:Dynamic = Reflect.field(state, field);
        if (textObj == null) return;

        setIfExists(textObj, "visible", true);
        setIfExists(textObj, "text", botplayText);
    }
}
