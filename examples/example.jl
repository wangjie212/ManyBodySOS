using Plots
using Revise
using ManyBodySOS

# 1D XXZ model
supp = Vector{UInt16}[[1;4]]
coe = [3/4]
L = 6
d = 4
@time begin
opt,cor0,cor1,cor2 = GSE(supp, coe, L, d, QUIET=true, posepsd=false, extra=2, correlation=true)
end

L = 10
J2 = 0.3
d,r = 4,5
tt = [1;1]
supp = Vector{UInt16}[[1;4], [1;7]]
coe = [3/4;3/4*J2]
time = @time begin
opt,cor0,cor1,cor2 = GSE(supp, coe, L, d, QUIET=true, posepsd=true, extra=r-1, three_type=tt, correlation=false)
end

supp = Vector{UInt16}[[1;4], [1;7]]
J2 = 0.1
coe = [3/4; 3/4*J2]
L = 40
r = 19
tt = [1;1]
@time GSE(supp, coe, L, 2, QUIET=true, extra=r-1, posepsd=false, three_type=tt, correlation=false)

L = 40
E = -0.44366306
coe = [1/4]
supp = Vector{UInt16}[[1;3*Int(L/2)+1]]
energy = [E-0.0001, E+0.0001]
r = 2
@time GSE(supp, coe, L, 4, energy=energy, posepsd=false, extra=r-1, QUIET=true, correlation=false)

L = 4
# E = -0.701777
# lE = -0.704741
# coe = [1/4]
# supp = Vector{UInt16}[[1;3*(slabel(Int(L/2)+1, Int(L/2)+1, L=L)-1)+1]]
# 2D XXZ model
supp = [UInt16[1;4]]
coe = [3/2]
# supp = [UInt16[1;4], UInt16[2;5], UInt16[1;10], UInt16[2;11]]
# coe = ones(4)
# energy = [E-0.0001, E+0.0001]

@time begin
opt,cor,_,_ = GSE(supp, coe, L, 4, lattice="square", QUIET=true, correlation=false)
end

# XXZ model
L=4
supp=Vector{UInt16}[]
for k=1:3, i=1:L, j=1:L
    push!(supp, sort([3*(slabel(i,j,L=L)-1)+k;3*(slabel(i+1,j,L=L)-1)+k]))
    push!(supp, sort([3*(slabel(i,j,L=L)-1)+k;3*(slabel(i,j+1,L=L)-1)+k]))
end
coe=ones(6*L^2)

# 1D Ising model
Jx=[0.027344478669940386, 0.7334256265797425, 0.41809116781859035, 0.8252743359002208, 0.4768567212289254, 0.08786761637107676, 0.17717478664017827, 0.8677594212198829, 0.21423087442936395, 0.8375362275303124, 0.7367436120938919, 0.27419750216055516, 0.632591323166978, 0.8413381619112881, 0.2339339117517174, 0.48446608319655593, 0.6318700804859962, 0.4552316087230406, 0.5530780799210746, 0.8375278206006966, 0.3546917353324983, 0.727650526364185, 0.11329015128994202, 0.8370001277613031, 0.14404645325205334, 0.06497018546756572, 0.2269323648630397, 0.4114109047360206, 0.1420664745594964, 0.5577083783420218, 0.7447570295956274, 0.5632993162988145, 0.07252496416269372, 0.7044508824765938, 0.5509803840342118, 0.11574023102725195, 0.8564033146032903, 0.5178356278499592, 0.6079200265246596, 0.13454881768014015, 0.8738750996774227, 0.6973504948926159, 0.9656300144130641, 0.9466186066792226, 0.4613106478573221, 0.29936188935847907, 0.40074891819152514, 0.6311416559026299, 0.6765424646265343, 0.4294432775353225, 0.7678834272581985, 0.2632330093892459, 0.24498698139996322, 0.02349719386560367, 0.9424873577573019, 0.27966719341456536, 0.9694278678769623, 0.12172325466317613, 0.6019579610674548, 0.36794998801924583, 0.3306537040581199, 0.7036107325339227, 0.8027453506797781, 0.06555745806672753, 0.46623853679363036, 0.9539928171537178, 0.13950520047238246, 0.051252737016451055, 0.060358968709331995, 0.97852350616607, 0.2949601632404526, 0.626639553021624, 0.44310808912361566, 0.8954829317173774, 0.631637966603392, 0.14167358435953092, 0.3232877953785982, 0.35462573766223127, 0.7961629817566551, 0.4579191560207725, 0.910419797829013, 0.7637811459285995, 0.7095697546445554, 0.5626441190091305, 0.927301530787171, 0.2464134738337873, 0.40425502391173174, 0.9388293058185395, 0.844108508026804, 0.7143770260846032, 0.6621337334333022, 0.9925772861995656, 0.896187847886821, 0.1392770073645868, 0.9432464561268961, 0.24206013316614405, 0.280228797805405, 0.5723501337566306, 0.1447054325034951, 0.04553444665512685, 0.15999472264651526, 0.7272670015971237, 0.03497187701606208, 0.07355474730613887, 0.06452070946832311, 0.9597585606538848, 0.45343695770645076, 0.4908922819810879, 0.7820564388105111, 0.03269910116530017, 0.31942962005545006, 0.4162292716916778, 0.5198072108010328, 0.6309335507689753, 0.46816832609056225, 0.8770658215413691, 0.636716936344784, 0.5399010659984276, 0.9378755678959227, 0.9412329486128623, 0.7786342520041469, 0.641540734313159, 0.9925678573928363, 0.6091728966072862, 0.8811737329002056, 0.6794278938215432, 0.23780681520193814, 0.7164845885657318, 0.01694165649439827, 0.7377321288222936, 0.7364039922376306, 0.7925596420472927, 0.2914433725161676, 0.12507084489286324, 0.8006173934614402, 0.7717896295329858, 0.3593491810716041, 0.22103070025627503, 0.7148238125829802, 0.33738897969189496, 0.935465840514317, 0.4535685939259406, 0.35199985823025925, 0.8758318585419618, 0.10699779603960913, 0.32458490358363346, 0.21242321201434322, 0.9150514592158545, 0.01920567600104106, 0.86442559745744, 0.6848327042431175, 0.165865724210555, 0.6386231549246191, 0.3678368961707781, 0.5208691828540315, 0.5480306412949927, 0.36441237199066, 0.7611392951385434, 0.9843938686931795, 0.3858109702234942, 0.5757902578699521, 0.6089226889179786, 0.2767466571465371, 0.5217839917010598, 0.30189478375507317, 0.07345719450887489, 0.8243627630844941, 0.6157002387341706, 0.15845381855165597, 0.26541894287546586, 0.8168375951473295, 0.4999761358484438, 0.24755751989278574, 0.8256107143560019, 0.8734774447858835, 0.7050886188067846, 0.29283858846663446, 0.09248048524493813, 0.13603569303218244, 0.29473556111271293, 0.7586816769804203, 0.18111626228499111, 0.8022924308201356, 0.06347588367895174, 0.8103237543918871, 0.755030050223576, 0.7511721088740695, 0.8706959781364167, 0.08448557831975179, 0.4736491041705626, 0.6833687567035123, 0.19504323391157863, 0.9798561652382738, 0.8390951522290231, 0.7405865115942933, 0.8388731683269763, 0.9919052889788251, 0.012212942935257542, 0.6823332502445076, 0.544502078256824, 0.8964218254956389, 0.4560369784842655, 0.9991627139934058, 0.1276197439973361, 0.7485713995096022, 0.906296909493707, 0.1391519839886719, 0.014619493096949654, 0.6866529519857496, 0.16276968899861965, 0.9577280912189483, 0.9312296785534764, 0.6462621838157117, 0.5411133909497372, 0.3513685558642441, 0.03215619070399334, 0.3288846102259697, 0.15365637226894635, 0.329498521628401, 0.7218426774229056, 0.9089394791901038, 0.6452890253105328, 0.15121575869266457, 0.7382704670589038, 0.11331943186828597, 0.7155155269257021, 0.6340830670391187, 0.7399481306440947, 0.3469033158343726, 0.4710282412318967, 0.038918139699459786, 0.28656895171299723, 0.2679013671928894, 0.8406087967200875, 0.14309839433213756, 0.46173854673562076, 0.5574967612646249, 0.665569828338682, 0.985460181843276, 0.2719337469047083, 0.05831413298390942, 0.7895382843784535, 0.676734040551948, 0.9487817836946897, 0.7761733459083653, 0.3800979667488349, 0.10990085660821336, 0.788594605626767, 0.8815543697408819, 0.9766422214843558, 0.0635055796701205, 0.10116276284292436, 0.11382393872925034, 0.6486586981443039, 0.9213126175375252, 0.8966617838678723]
L=256
supp=Vector{UInt16}[]
coe=Float64[]
for i=1:L-1
    push!(supp, [3*i;3*(i+1)], [3*i-2])
    push!(coe, -Jx[i], -0.4)
end
push!(supp, [3;3*L], [3*L-2])
push!(coe, -Jx[L], -0.4)

# 2D Ising model
L = 4
supp = Vector{UInt16}[]
coe = Float64[]
for i = 1:L, j = 1:L
    push!(supp, sort([3*(slabel(i,j,L=L)-1)+3;3*(slabel(i+1,j,L=L)-1)+3]))
    push!(supp, sort([3*(slabel(i,j,L=L)-1)+3;3*(slabel(i,j+1,L=L)-1)+3]))
    push!(supp, [3*(slabel(i,j,L=L)-1)+1])
    append!(coe, [randn(2);-0.4])
end

val = -159.5825333451152
# val = -sum([sqrt(2-2*cos((pi*(2i+1))/N)) for i=0:N-1])
# val = -sum([sqrt(1+h^2-2*h*cos((pi*(2i+1))/N)) for i=0:N-1])
# println(val)
println(opt)
gap = 100*(val-opt)/abs(val)
println(gap)

sdp=[-0.44448478113628725, -0.4444606061542179, -0.4444311122278256, -0.4444148714286771, -0.4441813350100799, -0.44411590640155285, -0.44401189045510214, -0.4439670083778977, -0.4439503644072499, -0.44394471417320014, -0.4438423961354116]
dmrg=-0.4436630695*ones(11)
r=1:11

G1=[-0.3804039097293036, -0.374091028153069, -0.3818991910382339, -0.4011755669726589, -0.4291709095614753, -0.4627720283002819, -0.49972033358010975, -0.7050744106321569, -0.9214514171352036]
G0=[-0.3810663863848417, -0.37481888853700995, -0.3826335839331308, -0.40207464193139497, -0.4302509473727288, -0.46386467313051405, -0.5009156676053576, -0.7065186307681994, -0.9234427025309797]
a=[0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.5, 2.0]

p=plot(a,50*(G1.-G0),dpi=600,shape=:circle,label=["spin gap, L=50, d=4"],xlabel="J2/J1",ylabel="E")

p=plot(1:9,G1.-G0,dpi=600,shape=:circle,label=["XXX, L=40, Jie d=4"],xlabel="r: the maximal distance in two-body monomials",ylabel="E/N")
plot!(p,r,dmrg,dpi=600,label=["XXX, L=40, DMRG"])
savefig("E:\\Programs\\ManyBodySOS\\data\\XXX1D_40_d4_extra2.png")

a=10:10:100
p=plot(a,opt,dpi=600,shape=:circle,label=["J2/J1=0.241167, j=0"],xlabel="L",ylabel="GSE")
plot!(p,a,opt1,dpi=600,shape=:star5,label=["J2/J1=0.241167, j=1"])
savefig("E:\\Programs\\ManyBodySOS\\data\\spin_gap.png")
