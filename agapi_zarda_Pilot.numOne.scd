

s.options.device = "Yamaha Steinberg USB ASIO";
s.reboot;

MIDIIn.connectAll;
MIDIFunc.trace(true);


s.meter;
s.plotTree;




/// Pre-recorded Sounds //


a = ~b1 = Buffer.read(s, "C:/Users/Agapi/Desktop/Μουσική Πληροφορική/lp.wav");                        //1016temp_16
{PlayBuf.ar(2, ~b1)}.play;

b = ~b2 = Buffer.read(s, "C:/Users/Agapi/Desktop/Μουσική Πληροφορική/lp.wav");                        //1017temp_17
{PlayBuf.ar(2, ~b2)}.play;

c = ~b3 = Buffer.read(s, "C:/Users/Agapi/Desktop/Μουσική Πληροφορική/lp.wav");                        //1018temp_18
{PlayBuf.ar(2, ~b3)}.play;

d = ~b4 = Buffer.read(s, "C:/Users/Agapi/Desktop/Μουσική Πληροφορική/snd_21_Feb_2021_03h18.wav");     //1019temp_19
{PlayBuf.ar(2, ~b4)}.play;

e = ~b5 = Buffer.read(s,"C:/Users/Agapi/Desktop/Μουσική Πληροφορική/tom_3.wav");                      //1020temp_20
{PlayBuf.ar(2, ~b5)}.play;





(
{
	a = { | amp = 0.2, rev = 0.7, room =0.8, mix = 0.6, buf = 0 |
		var sig;
		sig = amp * PlayBuf.ar(2, buf, 0.5, loop: 0, doneAction: 2);
		FreeVerb.ar(sig, rev, room, mix);
}.play(args: [\buf, ~b1.bufnum]);                                                                    //play buffer


0.1.wait;

	a.set(\amp, 0.3,
		  \rev, 0.7,
		  \room, 0.34,
		  \mix, 0.78
          );


10.wait;
b = { | amp = 0.1 | amp * PlayBuf.ar(2, ~b2, 2.5, 0, doneAction: 2); }.play;

90.wait;
c =	{ | amp = 0.2 | amp * PlayBuf.ar(2, ~b3, rrand(1.7, 3), 0, doneAction: 2); }.play;

150.wait;
d = { | amp = 0.2 | amp * PlayBuf.ar(2, ~b4, -0.5, loop: 1);}.play;                                // από soundgrain

85.wait;
e = { | amp = 0.1 | amp * PlayBuf.ar(2, ~b5, MouseY.kr(0.4, 3), loop: 1, doneAction: 2);}.play;



}.fork;
)




/// MIDI note- drops poly//////////////////////////////////////////////////////////////



(
SynthDef.new(\drops, {

	arg freq=440, amp= 1, vibamp = 0.1, gate=0, out=0;
	var sig, env, vib;
	vib = SinOsc.kr(6).bipolar(vibamp);
	vib = vib.midiratio;
	sig = SinOsc.ar(freq * vib, 0, amp!2);
	env = EnvGen.kr(
			Env.adsr,
			gate,
			doneAction:0

	);
		sig = sig * env;
	Out.ar(out, sig);
}).add;
)

x = Synth(\drops, [\gate, 1])
x.set(\vibamp, 0.2);
x.set(\gate, 0);



~notes = Array.fill(128, {nil});

(
MIDIdef.noteOn(\on, {
	arg val, num, chan, src;
	[val, num, chan, src].postln;
	~notes[num] = Synth.new(
		\drops, [
		\freq, num.midicps,
		\amp, val.linexp(1, 127, 0.02,0.3),
		\gate, 1,
		\out, 0

	]);

})
)

(
MIDIdef.noteOff(\off , {
    arg val, num, chan, src;
    [val, num, chan, src].postln;
	~notes[num].set(\gate, 0);
	~notes[num] = nil;
});
)


(
MIDIdef.cc(\vib, {
	arg val, num, chan, src;
	[val, num].postln;
	~notes.do({
		arg synth;
		synth.set(\vibamp, val.linlin(0, 127, 0.5, 0.5));
	});

}, 1)
)




/// SoundIn Left /// contact mic improv////////////////////////////////////////////////



s.meter;


(
	SynthDef.new(\mic0, {
	arg in= 0, out=0, deltime= 0.6, mix = (-0.3), decay = 3, amp= 0.5, rev = 0.5, room =0.2;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = DelayL.ar(sig, 0.8, SinOsc.kr(0.8).exprange(0.5,0.3), decay);
	sig = FreeVerb.ar(sig, rev, room);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

y = Synth(\mic0);
y.free;




/// SoundIn Right /// circuit improv


(
	SynthDef.new(\mic1, {
	arg in= 1, out=0, deltime= 0.8, mix = (-0.3), decay = 2, amp= 0.1, rev = 0.8, room =0.9;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = DelayL.ar(sig, 0.8, SinOsc.kr(0.9).exprange(0.8,0.5), decay);
	sig = FreeVerb.ar(sig, rev, room);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

z = Synth(\mic1);
z.free;











/////////



s.record;
s.stopRecording;








//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









