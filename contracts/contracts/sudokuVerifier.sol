// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity ^0.8.19;

contract SudokuVerifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 5278452432632039605648131843798226187727024201052668268629453529345688312715;
    uint256 constant deltax2 = 539247257794890106783090719157508227495964839352023583880785475647815101489;
    uint256 constant deltay1 = 18145831208779604454371537582307570709140203722999595021490929413818868763838;
    uint256 constant deltay2 = 9606730894874625018829697190916584678269904202806836194098765402020440956228;

    
    uint256 constant IC0x = 8289949299271585244411464387152706207855528662399497767604473248135248618501;
    uint256 constant IC0y = 602028220687630964399601756732824157515691527454261366150903802976420170833;
    
    uint256 constant IC1x = 14378614567796858531052006437535965614747837346393720460512563148291821987680;
    uint256 constant IC1y = 15555244453962110638848111886193360887199688654681164787526299320694262129098;
    
    uint256 constant IC2x = 5818922173783464046609914691700297183892869790347383162336881422857626965859;
    uint256 constant IC2y = 16733498363225660252327029519880970951571562997162023232022534229783200944238;
    
    uint256 constant IC3x = 5092993782537258807641439834601384333627245754665012352746699258865489532278;
    uint256 constant IC3y = 6302597501050031411235112864226972903773938518149854239673766462986427025444;
    
    uint256 constant IC4x = 4912632520132619583813816059928125354654448673050705078314256218971540126788;
    uint256 constant IC4y = 11170705717488484606670707756873148907411091666521545041257981292553708577566;
    
    uint256 constant IC5x = 1595281918557112211704460984484569663806970442108375730925678146147766726918;
    uint256 constant IC5y = 4002128832513127191510037546391710655871577304461341019521507937779207505917;
    
    uint256 constant IC6x = 4848878577437379474294890334689832184786197666705903504194333680434649524164;
    uint256 constant IC6y = 17656290862807488577688892178029519564873817612782446410171899189234418739783;
    
    uint256 constant IC7x = 15458421215813595686644631553118885907695001368264965790792731076399319844632;
    uint256 constant IC7y = 18175482125305858920189493969494979706909982663410096036861630371982741169954;
    
    uint256 constant IC8x = 16367691549466335040267024387442879586480972779448860888043445653702314255914;
    uint256 constant IC8y = 16964201102111217998081756184709321180201909045120686123033023610144146198147;
    
    uint256 constant IC9x = 3624796315693454340858424549157013728085407033440043076639306245580090456553;
    uint256 constant IC9y = 1976992820594523356909003405919050363801175539238311110789026921801806400573;
    
    uint256 constant IC10x = 17462752580625277929791051841334898397036652556807743384467723719471756123124;
    uint256 constant IC10y = 16819997995738403106739940618566093505702557494067025022199538185598311641889;
    
    uint256 constant IC11x = 9455335354694499719845134949859403501728654097679061286037970299476919687307;
    uint256 constant IC11y = 11433801080083265649202449339925741550582342053554550445021045871728610836418;
    
    uint256 constant IC12x = 711826627698756055311111679562196443188151692109575931219329561178330694567;
    uint256 constant IC12y = 18314649810316995488648964980733612463358535136926551238917599406285844382015;
    
    uint256 constant IC13x = 14608446715058089794085413469736036658914092070792544716950852890075274409731;
    uint256 constant IC13y = 2695090167984400054478654804756237615629139035154177928494046123382271249511;
    
    uint256 constant IC14x = 8486084525579340106086841388522353580839020657718292673085307633539044134395;
    uint256 constant IC14y = 6393293363501266802181709411693905416943772932733253886332274801069272857029;
    
    uint256 constant IC15x = 6202255976515487149767163339682948516114970756089708490698721090110492956927;
    uint256 constant IC15y = 11442965624243855528311888691934320347785169385055651312322980373665696393489;
    
    uint256 constant IC16x = 2427406078300016346099328251725341908151482030149106958359255522591825266495;
    uint256 constant IC16y = 6265007926905790788637060806705608471212554860237688560613474911422651815107;
    
    uint256 constant IC17x = 19933171165980578267191174519968941299991889312267300131836215856994898539018;
    uint256 constant IC17y = 20168475689498721001020662355446426060329614971207065705125179356502167710560;
    
    uint256 constant IC18x = 12689259411571922700677035916285013035656177480817156961917650557323344394345;
    uint256 constant IC18y = 5277825330739072678940889338712059795210076282120185727429469686265493502103;
    
    uint256 constant IC19x = 9572181380316732701213756245635389965201349057622438896085662205445374899183;
    uint256 constant IC19y = 15583315569515477306022406889191258635434676581474542717916819190864539062086;
    
    uint256 constant IC20x = 2847370930569562703234972432331706852935414642888275464108667473417416726831;
    uint256 constant IC20y = 10192328433568336163320751531103050503468245059547972583399278815624387305693;
    
    uint256 constant IC21x = 3148001468606845930653475266638748627250562000290912510211412705261566601429;
    uint256 constant IC21y = 12686526959694806548705987688908354287889083338681273821264937932619954056763;
    
    uint256 constant IC22x = 15280576648223251274763364258420219835509658816023079647749768436556238621747;
    uint256 constant IC22y = 4815190493976512290558059460845248554192947779234674915749071490141330696482;
    
    uint256 constant IC23x = 2465295209117577185256476161031150889678348434228998301944831595200267625788;
    uint256 constant IC23y = 20120231664591368310696951650461388658222378907697923067234400693415128277536;
    
    uint256 constant IC24x = 14926958798797811891313047859244214838984758020067646870774390125930012289483;
    uint256 constant IC24y = 7499490475698520742358190617911497604399108474351630797167563470294041713243;
    
    uint256 constant IC25x = 5651877378830823490627523597944668997982686830770791191445990804589882582113;
    uint256 constant IC25y = 20156092256424617643718039573665670734375679269028865644833703936500255606726;
    
    uint256 constant IC26x = 7504272470569355899868755870328617652241072213119181304548402945498570793373;
    uint256 constant IC26y = 8846469774373572483583795053024154332894980295714261652440255439028539531199;
    
    uint256 constant IC27x = 7745048837389693113391012407389872983446752414230852265947916122410104689796;
    uint256 constant IC27y = 2070490294080312503345152977264188593663505453301703963981438225029135972527;
    
    uint256 constant IC28x = 20099023108371251044091221805274920630779706150242970663140214657564551904454;
    uint256 constant IC28y = 17139272770902863131118168609572847350474393431405219174594382882785430177991;
    
    uint256 constant IC29x = 1617324759645918831739379720458663499051939261305008335559434794383369316548;
    uint256 constant IC29y = 4605675175146542492889736967530266081353823877324265448257028071244204406;
    
    uint256 constant IC30x = 11254693718672614707273259291499224653803930306190876730661415279095250333381;
    uint256 constant IC30y = 12997277227907748605385687012462781845302074152408687300767530601772431527185;
    
    uint256 constant IC31x = 12759837877965584982150839033126687246788298116170070303217409759549358540668;
    uint256 constant IC31y = 3229159766114859368462547836534815209726685360683152459382868759310053908643;
    
    uint256 constant IC32x = 17601099947681249733100541879949676517534774783229201706713729104290942219609;
    uint256 constant IC32y = 17586314489822200114649977200647626628785820437023085187047752307991516381875;
    
    uint256 constant IC33x = 3173808842118723795457418927018103399025554791377652540819112103959048160243;
    uint256 constant IC33y = 6263692657087894488172519024967769133961061579602483447526771231867588448409;
    
    uint256 constant IC34x = 14780580578852031295033129203578440340060013857681729906877751843744568193955;
    uint256 constant IC34y = 7960447707707366011985619839703261998516075554265661960452345826043779804995;
    
    uint256 constant IC35x = 10365742036653366417900680557726332048888260158303975951769167209046582841551;
    uint256 constant IC35y = 16456768020293053726376654363110050823855737375426068875727632682503546806876;
    
    uint256 constant IC36x = 14177320480300608460294641515436067381983953368356445509012139367828565767941;
    uint256 constant IC36y = 5431004102709619161359698922523286862058554813409364085671337768182736281939;
    
    uint256 constant IC37x = 293230444967840614758801127964754180733959229727216797122730917431359089589;
    uint256 constant IC37y = 14875590396326952645460931639321907919274963694110345592961084343819183764184;
    
    uint256 constant IC38x = 18797544178158770217059729669189426909978000361224522200793334540674917371567;
    uint256 constant IC38y = 20290877121459519702820410360738219352282672672374682507632565317959068205537;
    
    uint256 constant IC39x = 19958296981701316500551766209271460026883105709410468589166404883137323184604;
    uint256 constant IC39y = 12411592536332194574694527847089538174950924660173703277730359062249619955440;
    
    uint256 constant IC40x = 13702874537615381283113449753131332745396958885525462068226713415221846902504;
    uint256 constant IC40y = 466370650705419845197319871541863560025286121677183669802933529573193977261;
    
    uint256 constant IC41x = 1564722864213472680772898311763496009558833281684845399054028307501794337286;
    uint256 constant IC41y = 20241710348592242445200283866671461769301589136698889212494880082097108539801;
    
    uint256 constant IC42x = 15982456674004828717503956076306947057721908151371527963951232132385031872062;
    uint256 constant IC42y = 17613818844756238390196838244042616255770539035507001754056999389039571626841;
    
    uint256 constant IC43x = 21154988015533700698675720732333943098482824414601058289263181415678284495992;
    uint256 constant IC43y = 10766313902445190505121132727247301769415271192688035556652935692675690145385;
    
    uint256 constant IC44x = 20949636158745155667777739817736113880056425836755865081591721463582501686393;
    uint256 constant IC44y = 3517750746802880168063423739329892364089502864038479399503374331945072025181;
    
    uint256 constant IC45x = 16557957881893562520771397953038067039329409661728724076504826783253667009935;
    uint256 constant IC45y = 3493457307920328230834134382953710662116289888380744688650403718185028951054;
    
    uint256 constant IC46x = 12556176207794754796821244214452181104455244839246376329511829508923611065480;
    uint256 constant IC46y = 447949295467628042668399028550812979677407305895244103266757812138145370614;
    
    uint256 constant IC47x = 8358270255272926833865119696678885418069729347548951218154858098536224018586;
    uint256 constant IC47y = 4740889545402143211940199025090609186228064185298579298606994108445843952341;
    
    uint256 constant IC48x = 5661867920706466694045495365863083535069105832260025514628509763613650455129;
    uint256 constant IC48y = 631278856580370108159533506912607278402808979356091896671743635451515381272;
    
    uint256 constant IC49x = 958534180547026515252870767579970700576016759464081791075393420254385766962;
    uint256 constant IC49y = 21598483303556483555587470445152221278689809423938538591034593092855545113630;
    
    uint256 constant IC50x = 9059118511341741927452873156535905481277004674790531969589878848965634995721;
    uint256 constant IC50y = 7759076015762461843955064400708628689665128176518433370692126258316781044589;
    
    uint256 constant IC51x = 18000189169591715341879655441866730617951284169166435407534930596317439230571;
    uint256 constant IC51y = 9237692551734095731335721811509563215371073110856358717074715195706992731536;
    
    uint256 constant IC52x = 13875495990227505228446859913301000050997840352882736374309618075415310894648;
    uint256 constant IC52y = 3497276303949216285159458753087914672946164176419127627578799181015095956873;
    
    uint256 constant IC53x = 18447324748162254557490058359493475348866958049718715121269546281859097875236;
    uint256 constant IC53y = 17077342491879725483408384985562872427778043781188668948568754633334966147582;
    
    uint256 constant IC54x = 12851056729071923779895951169999899723192332071242327892104940178549135250767;
    uint256 constant IC54y = 18634098455836127811166537054006769004625567161896081603107849451917841610029;
    
    uint256 constant IC55x = 17403056415026394500298873560117615010477265904720715456810417508186205303034;
    uint256 constant IC55y = 8964264574319211246675268341429720450511948605205744556261372597555758671802;
    
    uint256 constant IC56x = 18076699560142031249365246487867216573467696461365894405244494672668265559911;
    uint256 constant IC56y = 3846332807924276770069687030211249511052092299439390683646280741932556175212;
    
    uint256 constant IC57x = 77519037424879463498594143523086832364892778842456437054079427865698674768;
    uint256 constant IC57y = 6234020029278098010442369543106746611262917860119526547845899987070452927155;
    
    uint256 constant IC58x = 19650352048870088123355117953243496107099075237274114851765312863420178229097;
    uint256 constant IC58y = 10950108713102878453907148978492208067110447584738718802082216276647381125337;
    
    uint256 constant IC59x = 4089846277309905920586812937579634932927041973309126976909424779539590437521;
    uint256 constant IC59y = 16472710219322117499520866547339568760128277711833416003185110132525826992206;
    
    uint256 constant IC60x = 3562400560182011603204073482249013763255845752734021837260387420734067465802;
    uint256 constant IC60y = 566201039058796287201629017713992492518344077384066931553594729805860806751;
    
    uint256 constant IC61x = 7871742474534361706329311011956372267757125908421038101063080056794069777086;
    uint256 constant IC61y = 3388386647449561775701169844845217317795433096109859259799076496377267701513;
    
    uint256 constant IC62x = 7173871911007249670749514428358873088359375797528368312946388329573810755094;
    uint256 constant IC62y = 11453598252068068210646741408968788245969259663830102964256690295858306894797;
    
    uint256 constant IC63x = 8030036706905250057707130166764568759869289421792861235643223918662069112599;
    uint256 constant IC63y = 21710263275910884203412915512304751240888507453381604058564846537925964739440;
    
    uint256 constant IC64x = 10252108491481663646364239559488669473340990765161097080381759825411878346340;
    uint256 constant IC64y = 2318411219443031223556078150091452975621960559518557995101011583264341339419;
    
    uint256 constant IC65x = 8382798759916358141275601700827962870337446114207503865940817036384939891543;
    uint256 constant IC65y = 20195646290580584227072537779857780996174230198622241354752629301319019319830;
    
    uint256 constant IC66x = 3409860861889595512046375962758554547177114993541625056380996674981022078925;
    uint256 constant IC66y = 6533268803614419258954947653080079844123930052516011388860224235942385065464;
    
    uint256 constant IC67x = 19900371125318484880578259019112913626825499003482769033002090154409007806470;
    uint256 constant IC67y = 7111207192414851491611143534233933059865974877235228351894012799734359793110;
    
    uint256 constant IC68x = 21271397541842631528252310593419300180653119200089107586442372529135730988003;
    uint256 constant IC68y = 2688555989209285931424196363584054455300368074708220057620903764463581401464;
    
    uint256 constant IC69x = 5886576876121043358717636332812212860233972861939640917947913866135502264290;
    uint256 constant IC69y = 6326147844104426259880758446195334756846013861213437378207265716524892168506;
    
    uint256 constant IC70x = 13128902859394729149824157303937334996069428505107018276444662824334639894947;
    uint256 constant IC70y = 18444329305895870335316246955960144394462296257927984180751266981446675630485;
    
    uint256 constant IC71x = 11274098429209630128294417483088302440848007996023671818547799560579043690500;
    uint256 constant IC71y = 13626252394859635987457241891372394163218817631713354084317688164302306233628;
    
    uint256 constant IC72x = 21149014631849729207256892706304922131628355199958190403080613186569192403715;
    uint256 constant IC72y = 21709577982336190825597091912253255051913118938407546975241076017533144776950;
    
    uint256 constant IC73x = 7002655808624107464778523378781303205943576613705391082336233163141366941625;
    uint256 constant IC73y = 6066259973159651648923232247842286945028211585707448509680516714551636520523;
    
    uint256 constant IC74x = 12068520550543033674252359113638590577017139722512125328499423662755506689393;
    uint256 constant IC74y = 14393494617908122906623281386837266592601968918709674782379677407270057080741;
    
    uint256 constant IC75x = 4266451363767364819833569662913332949276293908907951959008051168195499528708;
    uint256 constant IC75y = 3096758584798287081616863539326112678635565487427292668334827991840338944149;
    
    uint256 constant IC76x = 21101581578823257706513744407948708459007606485197437262949088670685559188513;
    uint256 constant IC76y = 5324283950791690771607509093987776613882092884856347345472152848544886030004;
    
    uint256 constant IC77x = 18843153333286691505644566178010396886618592077079890128575065017465629466420;
    uint256 constant IC77y = 4674543773702741769046933785598608160155729438797894294314682517785467134355;
    
    uint256 constant IC78x = 12096683708924994572228328162555146811088851226831030783533896171306298725418;
    uint256 constant IC78y = 20793324826206902282780329555921182292797070505644766978149081356376061497924;
    
    uint256 constant IC79x = 7544557328007047733582127225601307022359787484893666085302448606181632124212;
    uint256 constant IC79y = 11756013476233046033037765003192626267548085693888580890701021937685244068698;
    
    uint256 constant IC80x = 18097734944168659063456376453496520468315447634785332503315087648788909672612;
    uint256 constant IC80y = 1856440567390246762480021154490641867711083663933065171343466778316296080451;
    
    uint256 constant IC81x = 9623096166063491489103363826845355271985303939647220842793290763427957658175;
    uint256 constant IC81y = 19193198634930537658034729213867468798270912267021581331906466973246556672464;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[81] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                
                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))
                
                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))
                
                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))
                
                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))
                
                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))
                
                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))
                
                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))
                
                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))
                
                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))
                
                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))
                
                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))
                
                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))
                
                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))
                
                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))
                
                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))
                
                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))
                
                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))
                
                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))
                
                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))
                
                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))
                
                g1_mulAccC(_pVk, IC47x, IC47y, calldataload(add(pubSignals, 1472)))
                
                g1_mulAccC(_pVk, IC48x, IC48y, calldataload(add(pubSignals, 1504)))
                
                g1_mulAccC(_pVk, IC49x, IC49y, calldataload(add(pubSignals, 1536)))
                
                g1_mulAccC(_pVk, IC50x, IC50y, calldataload(add(pubSignals, 1568)))
                
                g1_mulAccC(_pVk, IC51x, IC51y, calldataload(add(pubSignals, 1600)))
                
                g1_mulAccC(_pVk, IC52x, IC52y, calldataload(add(pubSignals, 1632)))
                
                g1_mulAccC(_pVk, IC53x, IC53y, calldataload(add(pubSignals, 1664)))
                
                g1_mulAccC(_pVk, IC54x, IC54y, calldataload(add(pubSignals, 1696)))
                
                g1_mulAccC(_pVk, IC55x, IC55y, calldataload(add(pubSignals, 1728)))
                
                g1_mulAccC(_pVk, IC56x, IC56y, calldataload(add(pubSignals, 1760)))
                
                g1_mulAccC(_pVk, IC57x, IC57y, calldataload(add(pubSignals, 1792)))
                
                g1_mulAccC(_pVk, IC58x, IC58y, calldataload(add(pubSignals, 1824)))
                
                g1_mulAccC(_pVk, IC59x, IC59y, calldataload(add(pubSignals, 1856)))
                
                g1_mulAccC(_pVk, IC60x, IC60y, calldataload(add(pubSignals, 1888)))
                
                g1_mulAccC(_pVk, IC61x, IC61y, calldataload(add(pubSignals, 1920)))
                
                g1_mulAccC(_pVk, IC62x, IC62y, calldataload(add(pubSignals, 1952)))
                
                g1_mulAccC(_pVk, IC63x, IC63y, calldataload(add(pubSignals, 1984)))
                
                g1_mulAccC(_pVk, IC64x, IC64y, calldataload(add(pubSignals, 2016)))
                
                g1_mulAccC(_pVk, IC65x, IC65y, calldataload(add(pubSignals, 2048)))
                
                g1_mulAccC(_pVk, IC66x, IC66y, calldataload(add(pubSignals, 2080)))
                
                g1_mulAccC(_pVk, IC67x, IC67y, calldataload(add(pubSignals, 2112)))
                
                g1_mulAccC(_pVk, IC68x, IC68y, calldataload(add(pubSignals, 2144)))
                
                g1_mulAccC(_pVk, IC69x, IC69y, calldataload(add(pubSignals, 2176)))
                
                g1_mulAccC(_pVk, IC70x, IC70y, calldataload(add(pubSignals, 2208)))
                
                g1_mulAccC(_pVk, IC71x, IC71y, calldataload(add(pubSignals, 2240)))
                
                g1_mulAccC(_pVk, IC72x, IC72y, calldataload(add(pubSignals, 2272)))
                
                g1_mulAccC(_pVk, IC73x, IC73y, calldataload(add(pubSignals, 2304)))
                
                g1_mulAccC(_pVk, IC74x, IC74y, calldataload(add(pubSignals, 2336)))
                
                g1_mulAccC(_pVk, IC75x, IC75y, calldataload(add(pubSignals, 2368)))
                
                g1_mulAccC(_pVk, IC76x, IC76y, calldataload(add(pubSignals, 2400)))
                
                g1_mulAccC(_pVk, IC77x, IC77y, calldataload(add(pubSignals, 2432)))
                
                g1_mulAccC(_pVk, IC78x, IC78y, calldataload(add(pubSignals, 2464)))
                
                g1_mulAccC(_pVk, IC79x, IC79y, calldataload(add(pubSignals, 2496)))
                
                g1_mulAccC(_pVk, IC80x, IC80y, calldataload(add(pubSignals, 2528)))
                
                g1_mulAccC(_pVk, IC81x, IC81y, calldataload(add(pubSignals, 2560)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            
            checkField(calldataload(add(_pubSignals, 864)))
            
            checkField(calldataload(add(_pubSignals, 896)))
            
            checkField(calldataload(add(_pubSignals, 928)))
            
            checkField(calldataload(add(_pubSignals, 960)))
            
            checkField(calldataload(add(_pubSignals, 992)))
            
            checkField(calldataload(add(_pubSignals, 1024)))
            
            checkField(calldataload(add(_pubSignals, 1056)))
            
            checkField(calldataload(add(_pubSignals, 1088)))
            
            checkField(calldataload(add(_pubSignals, 1120)))
            
            checkField(calldataload(add(_pubSignals, 1152)))
            
            checkField(calldataload(add(_pubSignals, 1184)))
            
            checkField(calldataload(add(_pubSignals, 1216)))
            
            checkField(calldataload(add(_pubSignals, 1248)))
            
            checkField(calldataload(add(_pubSignals, 1280)))
            
            checkField(calldataload(add(_pubSignals, 1312)))
            
            checkField(calldataload(add(_pubSignals, 1344)))
            
            checkField(calldataload(add(_pubSignals, 1376)))
            
            checkField(calldataload(add(_pubSignals, 1408)))
            
            checkField(calldataload(add(_pubSignals, 1440)))
            
            checkField(calldataload(add(_pubSignals, 1472)))
            
            checkField(calldataload(add(_pubSignals, 1504)))
            
            checkField(calldataload(add(_pubSignals, 1536)))
            
            checkField(calldataload(add(_pubSignals, 1568)))
            
            checkField(calldataload(add(_pubSignals, 1600)))
            
            checkField(calldataload(add(_pubSignals, 1632)))
            
            checkField(calldataload(add(_pubSignals, 1664)))
            
            checkField(calldataload(add(_pubSignals, 1696)))
            
            checkField(calldataload(add(_pubSignals, 1728)))
            
            checkField(calldataload(add(_pubSignals, 1760)))
            
            checkField(calldataload(add(_pubSignals, 1792)))
            
            checkField(calldataload(add(_pubSignals, 1824)))
            
            checkField(calldataload(add(_pubSignals, 1856)))
            
            checkField(calldataload(add(_pubSignals, 1888)))
            
            checkField(calldataload(add(_pubSignals, 1920)))
            
            checkField(calldataload(add(_pubSignals, 1952)))
            
            checkField(calldataload(add(_pubSignals, 1984)))
            
            checkField(calldataload(add(_pubSignals, 2016)))
            
            checkField(calldataload(add(_pubSignals, 2048)))
            
            checkField(calldataload(add(_pubSignals, 2080)))
            
            checkField(calldataload(add(_pubSignals, 2112)))
            
            checkField(calldataload(add(_pubSignals, 2144)))
            
            checkField(calldataload(add(_pubSignals, 2176)))
            
            checkField(calldataload(add(_pubSignals, 2208)))
            
            checkField(calldataload(add(_pubSignals, 2240)))
            
            checkField(calldataload(add(_pubSignals, 2272)))
            
            checkField(calldataload(add(_pubSignals, 2304)))
            
            checkField(calldataload(add(_pubSignals, 2336)))
            
            checkField(calldataload(add(_pubSignals, 2368)))
            
            checkField(calldataload(add(_pubSignals, 2400)))
            
            checkField(calldataload(add(_pubSignals, 2432)))
            
            checkField(calldataload(add(_pubSignals, 2464)))
            
            checkField(calldataload(add(_pubSignals, 2496)))
            
            checkField(calldataload(add(_pubSignals, 2528)))
            
            checkField(calldataload(add(_pubSignals, 2560)))
            
            checkField(calldataload(add(_pubSignals, 2592)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
