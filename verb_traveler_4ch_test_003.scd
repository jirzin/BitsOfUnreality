// =====================================================================
// SuperCollider Workspace
// =====================================================================

s = Server.local.boot;
(
o = Server.local.options;
o.numInputBusChannels = 8;
o.numOutputBusChannels = 8;
s.reboot;
)

1.0.rand

s.freeAll
s.scope(16);

p = ProxySpace.push()

(
~bow.play;
~bow={
	// var b = DWGBowed.ar(
	// 	freq: 36.midicps,
	// 	velb: 0.245,
	// 	force: 0.51,
	// 	gate: 1,
	// 	pos: SinOsc.ar(3)*0.5+0.5,
	// 	release: 0.07,
	// 	c1: 1,
	// 	c3: 3,
	// 	impZ: 0.9999,
	// 	fB: 0.82
	// );
	//b = BPF.ar(b,130,0.1)+b;
	//b = BPF.ar(b,250,1);
	 // b = JPverb.ar(
	 // 	in: b,
	 // 	t60: 10,
	 // 	damp: 0.6,
	 // 	size: 0.3,
	 // 	earlyDiff: 0.207,
	 // 	modDepth: 0.61,
	 // 	modFreq: 1,
	 // 	low: 1,
	 // 	mid: 1,
	 // 	high: 1,
	 // 	lowcut: 1500,
	 // 	highcut: 8000
	// );
	b = SinOscFB.ar(50);
	b = Normalizer.ar(b);
	Out.ar(7,b);
}
)
~bow=nil;

(
~tt.play;
~tt.quant=4;
~tt={Pulse.kr(1/8,0.0025)*0.5};
)

(
~source.play;
~source.quant = 8;
~source={
	Out.ar(5,		
		(0.82*Dust.ar(7))
	)

};
)
~source=nil;


(
~verb_1.play;
~verb_1 = {
	var i1 = Clip.ar(In.ar(15),-1,1);
	var i2 = Clip.ar(In.ar(13),-1,1);
	var convol_sig = Convolution.ar(i1,i2,8192,0.25);
	var d = PeakFollower.ar(i2,0.3);//Line.kr(0,20,120),
	var sig = NumChannels.ar(JPverb.ar(
		in: convol_sig,
		t60: 20-(d*20+2),
		damp: d*0.9,
		size: 1-(d*0.95),
		earlyDiff: 0.907,
		modDepth: 0.91,
		modFreq: 0.2,
		low: 2,
		mid: 0.685,
		high: 0.991,
		lowcut: 2000,
		highcut: 8000),1,true)*0.083;
	sig = Convolution.ar(sig,i2,32,0.5);
	sig = Normalizer.ar(sig);
	Out.ar(6,sig)
};
)
a.free
~verb_1=nil;

(
a = {
	SplayAz.ar(
		4, 
		In.ar(14), 
		spread: 4,
		level: 1,
		width: MouseY.kr(1,4),
		center: 0,
		orientation: MouseX.kr(0,4),
		levelComp: true)
}.play(s);
)
a.free;
~test={Out.ar(2,SinOsc.ar(2000))}.play;

(
p={
	SplayAz.ar(
		8,
		PitchShift.ar(In.ar(8),0.42,1.82),
		spread: 8,
		level: LFNoise2.ar(0.11)*0.15+0.4,
		width: LFNoise2.ar(0.16)*0.3+0.5*16,
		center: 0,
		orientation: LFNoise2.ar(0.2)*0.5+0.5*10,
		levelComp: true)
}.play(s);
)
p.free

(
q = {
	Out.ar(0,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(1,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(2,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(3,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(4,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(5,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(6,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(7,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
}.play(s)
)
q.free

(
q = {
	Out.ar(0,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(8),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(1,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(9),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(2,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(10),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(3,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(11),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(4,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(12),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(5,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(13),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(6,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(14),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
	Out.ar(7,AllpassC.ar(LFNoise2.ar(0.1)*0.2+0.8*In.ar(15),0.2,LFNoise2.ar(0.1)*0.1+0.1,0));
}.play(s)
)
q.free



(
p={
	SplayAz.ar(
		8,
		In.ar(8),
		spread: 8,
		level: SinOsc.ar(Line.kr(1/8,1,120))*0.3+0.7,
		width: SinOsc.ar(Line.kr(1/8,2,120))*0.3+0.7*10,
		center: 0,
		orientation: LFNoise2.ar(Line.kr(0.2,5,120))*0.5+0.5*15,
		levelComp: true)
}.play(s);
)
p.free