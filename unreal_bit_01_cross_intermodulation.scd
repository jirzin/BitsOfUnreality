// =====================================================================
// SuperCollider Workspace
// =====================================================================

s = Server.local.boot;
(
o = Server.local.options;
o.numInputBusChannels = 8;
o.numOutputBusChannels = 8;
o.memSize=2**14;
s.reboot;
)
s.scope(16);

p = ProxySpace.push()

// cross synthesis & intermodulation
(
~source_1.play;
~source_1={
	var i1 = In.ar(12);
	var sig = Perlin3.ar(
		SinOsc.ar(3000*i1)*4.71,
		SinOsc.ar(0.02)*(i1*0.25+0.25)*200,
		LFNoise2.ar(0.1)*100.31
	)*0.82;	
	sig = Convolution.ar(sig,In.ar(13),2**6,1);
	sig = BHiPass.ar(sig,50,0.083);
	sig = Normalizer.ar(sig)*0.1+sig;
	Out.ar(0,sig!2)
}
)
~source_1=nil;


