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

// hybrid feedback network 
(
~response_3.play;
~response_3.quant=1;
~response_3={
	var i = In.ar(8);
	var si = EnvFollow.ar(i,0.19,1);
	var sch = Schmidt.ar(si,0.12,0.09);
	var t = Trig.ar(sch);


	var spd1 = TRand.ar(0,1,t)*20;
	var spd2 = TRand.ar(0,1,t)*20;
	var spd3 = TRand.ar(0,1,t)*20;
	
	var r1 = Lag.ar(TRand.ar(0,1,t),spd1);
	var r2 = Lag.ar(TRand.ar(0,1,t),spd2);
	var r3 = Lag.ar(TRand.ar(0,1,t),spd3);
	var r4 = Lag.ar(TRand.ar(0,1,t),0.3);
	var r5 = Lag.ar(TRand.ar(0,1,t),0.3);
	var r6 = Lag.ar(TRand.ar(0,1,t),2.3);	
	
	var c1 = CombN.ar(i,2,r1*1.9+0.001,2);
	var c2 = CombN.ar(i,2,r2*0.3+0.001,1);
	var c3 = CombC.ar(i,3,r3*2.7+0.001,1);
	
	var sum = Mix.ar([c1,c2,c3]);

	var space = PitchShift.ar(GVerb.ar(sum,r4*70+1.3,r6*3+0.2),r6*20,r5-0.5+1);

	var o = -1*Normalizer.ar(sum+space)*0.23;
	
	Out.ar(0,o!2);
}
)
~response_3=nil;
