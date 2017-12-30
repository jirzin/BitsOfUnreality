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

p = ProxySpace.push()


// strange spatialization
// mono
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

// strange spatialization
// 8 ch input
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
