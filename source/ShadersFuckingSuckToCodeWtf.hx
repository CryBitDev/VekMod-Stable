package;

import flixel.system.FlxAssets.FlxShader;



class ShadersFuckingSuckToCodeWtf extends FlxShader 
{
        @:glFragmentSource('
                #pragma header

                uniform float rOffset;
		uniform float gOffset;
		uniform float bOffset;

                void main()
                {
			vec4 col1 = texture2D(bitmap, openfl_TextureCoordv.st - vec2(0.01, 0.0));
			vec4 col2 = texture2D(bitmap, openfl_TextureCoordv.st - vec2(0.0025, 0.0));
			vec4 col3 = texture2D(bitmap, openfl_TextureCoordv.st - vec2(0.0, 0.0));
			vec4 toUse = texture2D(bitmap, openfl_TextureCoordv);
			gl_FragColor = vec4(col1.r, col2.g, col3.b, 0.5);
                }')
        public function new()
        {
            super();
        }
}