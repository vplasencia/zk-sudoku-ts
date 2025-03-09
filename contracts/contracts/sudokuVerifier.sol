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

pragma solidity >=0.7.0 <0.9.0;

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
    uint256 constant deltax1 = 12470628304346224326942218424910663174885044074095786947429562683550471429432;
    uint256 constant deltax2 = 11793050865207323139896728374243050943006739630919979410522311245170086993265;
    uint256 constant deltay1 = 5801232806076931211753300027847013194504498517296704142652472199552596449599;
    uint256 constant deltay2 = 10603820723762391866468924028196102178917274443132970189466441453056403439751;

    
    uint256 constant IC0x = 6950144850160708582121904858744462112076533821667405279386917448592495460715;
    uint256 constant IC0y = 20294664317976576063915646793184944789887103314910115532030479920156789894867;
    
    uint256 constant IC1x = 15257484548923355098598249463185942073480234061638557531307017452281203058509;
    uint256 constant IC1y = 11254529496490321563488637623433457025605702314376992767187794256269548674624;
    
    uint256 constant IC2x = 3848835670486717453488648103773224220271021605902960732372299442041824950509;
    uint256 constant IC2y = 16761540811824678446417383704468295032360474018164517445186423584441216575590;
    
    uint256 constant IC3x = 11502499462329460689208763716829881815449382504740227865905600227021932728295;
    uint256 constant IC3y = 952247501896358548924184737257297993314538380776938682722340323439819235068;
    
    uint256 constant IC4x = 10696701998154177835012983645753473134827969734730966896397668364906983006690;
    uint256 constant IC4y = 14881301933092195874858264895581970291793572199861686337397414492612283569145;
    
    uint256 constant IC5x = 6976745799625930470091265345817831158370412352451728487495653296803090763884;
    uint256 constant IC5y = 18131262275639794412559589351967794045411888038394301191336469764921310270319;
    
    uint256 constant IC6x = 11428126406381038019156998983325445502180613564582129219272910054523070694336;
    uint256 constant IC6y = 15319581968902845234850829506541379299918402660147775911453672726079105209814;
    
    uint256 constant IC7x = 19021451293639432728607093148901781217294834202855576047597193871231407501795;
    uint256 constant IC7y = 8783767195627395370352384314581574863710516133420274244450803766455917599046;
    
    uint256 constant IC8x = 16588889360143645107788903327219170161868895269603308881502767549291661001447;
    uint256 constant IC8y = 21303593626437993902574050794722625029457000043646683855631212384705087145936;
    
    uint256 constant IC9x = 11868021394335810194779692137769584050615288623033649436496624222726495757549;
    uint256 constant IC9y = 17399920804877401932304462548216013392848871619716506123911968663977777253448;
    
    uint256 constant IC10x = 585778593178775642637448445218946412682451610512279738907734925496637872466;
    uint256 constant IC10y = 17981165134438628782577046407333076160639012136029451168745250331448807967562;
    
    uint256 constant IC11x = 21044001865208406455892300814900633053765425342209802109620617910029866860036;
    uint256 constant IC11y = 12484208411746104038860653460877221195935149064057443942514859747688276664787;
    
    uint256 constant IC12x = 7189704740504612649199052710543357994762631391781167716822205193225397978114;
    uint256 constant IC12y = 16404533297494840650929247871366073911399828889647815274356191428523794857626;
    
    uint256 constant IC13x = 5709776247799257999795588677084719310524242337776731011885650902887888579593;
    uint256 constant IC13y = 9564394203575894890194888237686590825895516206178718705483266776992002894553;
    
    uint256 constant IC14x = 3744987069602193448940623829929938017829981064947119850634693277022171837072;
    uint256 constant IC14y = 19476449109646828555726948137638644535927401823325519298720095672251473431083;
    
    uint256 constant IC15x = 4068387065387707544523929868478185617934758026484306963429235206142030648425;
    uint256 constant IC15y = 14151569442028374961222252561957846281492800712630127847682935187754953310182;
    
    uint256 constant IC16x = 16914524039702196399208949750961058937588810983276027417881627397875251450773;
    uint256 constant IC16y = 6406378935594619089882425885047125102239133545835879160012257768935505152884;
    
    uint256 constant IC17x = 17214061583689637214520279456926682918020393416440100038015803093012650263390;
    uint256 constant IC17y = 9418373162103529169699966139369694477334481908576390644854120207765242113740;
    
    uint256 constant IC18x = 21498097085277384755910017263429384349737456168565524238955066914917972023993;
    uint256 constant IC18y = 2733699558263213103619485305337775330537729886579573274857087938542269751813;
    
    uint256 constant IC19x = 16879516487096535865102467002036926544373893300355072842933661256257902615630;
    uint256 constant IC19y = 20194634531080279936653903103953664830227437345827822018721628650185809064271;
    
    uint256 constant IC20x = 17267839057684201774802622869091052789184190727889595722161384364984010172627;
    uint256 constant IC20y = 13443023536589774947510697955245177621583241515232369047875403960624251105820;
    
    uint256 constant IC21x = 6776698335193676544746961552434806087829395536988902477561241933709550797391;
    uint256 constant IC21y = 20797992164128948392416968644510252879522173034685729792988930563028923679579;
    
    uint256 constant IC22x = 1136456112537722868513992192448490187188507209107498991880287009756902064726;
    uint256 constant IC22y = 566802010147360302639984124996610017715771590220780914039793522687592082488;
    
    uint256 constant IC23x = 13070945132050522269330758774675860158322559527609633763395974679530180484814;
    uint256 constant IC23y = 10838038023773053167804362514263286506277744531786834908790449926688733833414;
    
    uint256 constant IC24x = 3708384181907307293855292513344739232658996331664848228210191948670208138316;
    uint256 constant IC24y = 4164043747838739680083169311375825654734963878838777613793578991671471900530;
    
    uint256 constant IC25x = 6980212620752210248981344609208711638192203093866027416110325723663079520525;
    uint256 constant IC25y = 12015640632884344067961912137775609900509823170786787548181543091312808740950;
    
    uint256 constant IC26x = 16995194418163968736594747303089319709111161231739937258070725338404266304243;
    uint256 constant IC26y = 5932258494110100774808118087026230766154321262256463164140976735278173736457;
    
    uint256 constant IC27x = 3678260786086825616354112255487826858110516404913934121630574818863797997853;
    uint256 constant IC27y = 7024083719832534495275411282040242813135287620255031549759116419662339291187;
    
    uint256 constant IC28x = 789634440562559383997269988744915199732463984885432652982271081126382422483;
    uint256 constant IC28y = 4501697848495586395004793442757359816840193228416682079964055814892878141338;
    
    uint256 constant IC29x = 18074346382890054624382722541374824826724861505496183913595352892081359592488;
    uint256 constant IC29y = 10455136526389144467246415407134442495848271761974925000494380068928649698840;
    
    uint256 constant IC30x = 1466627825612984015332652447346294337449550865059257665027627792845424432010;
    uint256 constant IC30y = 5460453414868565404258617115353591106519792896842588362839778117328126868132;
    
    uint256 constant IC31x = 17986661256772508377545131252806333020285101473677634721550141453151413948169;
    uint256 constant IC31y = 20272899804079004028295883276597395381548254945636634605215050175216454763565;
    
    uint256 constant IC32x = 13320867148408678026260416550296044644014985328145716058461627568954204638650;
    uint256 constant IC32y = 3751460736899833847542638638777085403798692365931730739915298837800536086022;
    
    uint256 constant IC33x = 10958656800922544412042400485083145966047826882086435290774969214626349196367;
    uint256 constant IC33y = 95124155426471871311330170263037906178489022776328844634505560696416537469;
    
    uint256 constant IC34x = 9365168364002302259382631731089258774263102566600067089743387682141993929427;
    uint256 constant IC34y = 3563644684185265039140753162712920866863953241877915705512370293723618185328;
    
    uint256 constant IC35x = 3093448948085876517898615086624584496068756940817323236687328657945661872765;
    uint256 constant IC35y = 297486498541308366187082475494605323903448456978784207409908643541578216753;
    
    uint256 constant IC36x = 9076506792803841257256919318306786648895492119139427267423955256312329107515;
    uint256 constant IC36y = 2758255522183233714685960303321825556721728614282623288545790677861481371261;
    
    uint256 constant IC37x = 5210105899549347778391549549678436620881655811684565584303004954732105336367;
    uint256 constant IC37y = 2169713145649919661966647503263198936432833700981708715453099944992456001356;
    
    uint256 constant IC38x = 7097554055052096601319234348100701551768696237119239403896199303675512594695;
    uint256 constant IC38y = 11234592858367192428075175618833768315042114637187658759612467972115449709073;
    
    uint256 constant IC39x = 1577179732860049859925318158470109299630106052399931936083279093431322607842;
    uint256 constant IC39y = 6504440509375583386372845136297094681423977189298014070783590832012318707995;
    
    uint256 constant IC40x = 942910169331014367709680135588730882097871110347159423402873034808771481662;
    uint256 constant IC40y = 3042725329709443754042788376219343975486288492577868223896702323862786525377;
    
    uint256 constant IC41x = 19246227009062924234111155055556084878504830880902591982932055478492025446333;
    uint256 constant IC41y = 10023081797898879429701074601225181402419496704275775716674027011885745604428;
    
    uint256 constant IC42x = 12562142951210300716163331038084643710725106546780891877369269980994984055100;
    uint256 constant IC42y = 14871676794449972715072996423533002325413318106846353393310578456161158702255;
    
    uint256 constant IC43x = 4136940579247467506257278414908190637084126361524974825862639507685210774587;
    uint256 constant IC43y = 12002402114736379953694617894304352436681681197263074903828129987747753157682;
    
    uint256 constant IC44x = 7442932585366909043054972760202491013515888930237680329674128689555546458351;
    uint256 constant IC44y = 7230467221110972340541472170232182962413029570602306873526931499452488341126;
    
    uint256 constant IC45x = 20722861770487910304151913410180617404614172897500877581297724189031180442808;
    uint256 constant IC45y = 21226311646622469462214946804227242888098439742677626909078333265733246004527;
    
    uint256 constant IC46x = 3268995449189653397436765779229869918668887266733885685898854747678377477272;
    uint256 constant IC46y = 4233899586060015779574694033579917837651082856885126155958791025476984990087;
    
    uint256 constant IC47x = 14380949638812815186486875151379313444307283833676471145239158136879181141134;
    uint256 constant IC47y = 7756770696878287998489584838257769429101159587650399720757264199096434738645;
    
    uint256 constant IC48x = 15664449740699035420282134582108032552407044267401204249411748562466012339343;
    uint256 constant IC48y = 10533864204837601192115366819459249812129002678613458718245526321851572065189;
    
    uint256 constant IC49x = 5370534917229878454015956089912314240342196608079053953244189941538874852784;
    uint256 constant IC49y = 6436479227896738712795423040093964923133139734427238840553579932897674388096;
    
    uint256 constant IC50x = 15619048984425028542086512531465644090244235887503506815279428444452962782992;
    uint256 constant IC50y = 4568134860982343092330526416902897325471357896102632131825120109125925842874;
    
    uint256 constant IC51x = 11243886604056354703945210262915685002382303037280284669874680843674654695497;
    uint256 constant IC51y = 21358523842284237474219588332000086900658361834034433876214618317904458749732;
    
    uint256 constant IC52x = 13926668134687927150818236531435789111034068137514406313712234836320712460607;
    uint256 constant IC52y = 19488297709822736685472138213932918478638547389132994853594780756919171299944;
    
    uint256 constant IC53x = 6528262112864900017117803449942784059885405197478892242402157789659537888258;
    uint256 constant IC53y = 1151928336297024788500665922535761754159918720302824472754614651621607026265;
    
    uint256 constant IC54x = 12693575509784651063144807246550977750704157127277987149784592952210612659396;
    uint256 constant IC54y = 7133324848761708507340406229967875490226426607483279682688256139320958617483;
    
    uint256 constant IC55x = 8641344335561437049479904589352964065974640325965074187912151164909036175598;
    uint256 constant IC55y = 15735353179830352936320878559449331738989572736153413167426161371211487100249;
    
    uint256 constant IC56x = 15295601990481380843124237746480716134306991470640019741135556067246004238687;
    uint256 constant IC56y = 11682028342682403324524967537289114413294991233996660103727746637623795999867;
    
    uint256 constant IC57x = 13038834955821845083669218477920517485211368549066054573478118008194008191272;
    uint256 constant IC57y = 16872714620234559548622545299515930763560471129904008990087610955700218899422;
    
    uint256 constant IC58x = 13646797386410652454475671370478468039067881227733363028161891703993166868985;
    uint256 constant IC58y = 11072560106209505030438923073675769439578819438650580554905443371187314757109;
    
    uint256 constant IC59x = 14721577292003911207637665536125247846940820430791954462976904391844017205746;
    uint256 constant IC59y = 14019464525686207502884779360729661525247230885302630422956472243202339604118;
    
    uint256 constant IC60x = 16322893917682980696678575615396392254603228863913499354286845718330947128599;
    uint256 constant IC60y = 12712819911846767816023904739834605521291886450658296330823654879197994312590;
    
    uint256 constant IC61x = 10503700099350188494126394635811998212188173465737964818751822489435868102047;
    uint256 constant IC61y = 19700843810780973906237306263660028657145982701366810167638737474766156318209;
    
    uint256 constant IC62x = 13356642796273651865338285692715762258301132030189929970355122484836620346931;
    uint256 constant IC62y = 19566169735764553969017102046501146925848666470533770430803576883883135057095;
    
    uint256 constant IC63x = 7750606116759721140216247245434664613314431768094867267159220161850984533636;
    uint256 constant IC63y = 965741844728254253447698270891018753380552832330559161005306853280616479351;
    
    uint256 constant IC64x = 7820712941506126819623722874486338349011848311605530758924828508373287041295;
    uint256 constant IC64y = 8792263136675169995031432436420482829209712909555832536853893169679153279161;
    
    uint256 constant IC65x = 4627550189286115747887636707878720520293798764560034107960828441361421976505;
    uint256 constant IC65y = 13022082683424091405277266989386933476026719867707484964225415679179684072350;
    
    uint256 constant IC66x = 1658463903002591236526171818862475395064641410427934195255016008116468670958;
    uint256 constant IC66y = 9400340009490479395986984397111572429864615524268320927185110295966483499924;
    
    uint256 constant IC67x = 19161771014841003890831749036878190704238389287451856530873894595739381059511;
    uint256 constant IC67y = 10191052429237880936251505285227100657613206834494045131697710303347419682429;
    
    uint256 constant IC68x = 5611063146009294570422085075417129541158453287315929921686608578654113058996;
    uint256 constant IC68y = 15504451682478313942994894640648402773157449368904843922525155427835652319167;
    
    uint256 constant IC69x = 2796954672355696340406129322986960909634706083281259662063628238056484131218;
    uint256 constant IC69y = 15195327935684249214886627482333294204616855515016788298177116325400858659022;
    
    uint256 constant IC70x = 12239296237772112458985829800372897789024719030329411976435039207367070255390;
    uint256 constant IC70y = 5090703195790296978929682429740297863314441413827810376601297015876369502240;
    
    uint256 constant IC71x = 10129821719560658841076389759539649291899972246466311585316635567765615264660;
    uint256 constant IC71y = 15057389564839279812506083169006399318643096900675425750402731871167281147162;
    
    uint256 constant IC72x = 19506114604428589771142803013210963098146931372814396609531427663093681357660;
    uint256 constant IC72y = 20179913848605340389051217213077867093689355373829342081421195386076445555670;
    
    uint256 constant IC73x = 16673728859465396981277306100912990799452156412834211034852790236657521835467;
    uint256 constant IC73y = 7220115306363263534347353765375543158700452627235713079883866184906352509234;
    
    uint256 constant IC74x = 2878187401022999493540996903650965140023854759276593605822129970631103477023;
    uint256 constant IC74y = 11331067873238174390160850733251632393142323161899352853156616332285420078765;
    
    uint256 constant IC75x = 11934682283257397172230980962312414089439258821915808392366686286122759747473;
    uint256 constant IC75y = 11597566092652678562910334603548129538801746821002028389965316501120556026857;
    
    uint256 constant IC76x = 10083652458381967868514164866657513136534531134737658699142720913539518185863;
    uint256 constant IC76y = 20080555877150542965070082510114628955034424318287598536362422080767975638955;
    
    uint256 constant IC77x = 14514463868726787173106891967034592630689153267629640947946016094332432057286;
    uint256 constant IC77y = 10288679479867955497997435365403192329827006151226365106730748885442967812191;
    
    uint256 constant IC78x = 18964334319716652762694783773352609023632904862648575876853172919959082344218;
    uint256 constant IC78y = 11083822494134246317409341476760645274438012390850155457304197583705588802497;
    
    uint256 constant IC79x = 16325825790109469078936294136080292656117471559454320962794058394160608749502;
    uint256 constant IC79y = 15990321084967556445637178278613623153846899690107470751611448080960117409294;
    
    uint256 constant IC80x = 9306595077564874260148312152293700433535351923929849214460423606161554893758;
    uint256 constant IC80y = 20313687993834213920536521368255653322159232832235109121455421423940257141971;
    
    uint256 constant IC81x = 18680508858399623611163186974309912969863770719947629352446391632627451582496;
    uint256 constant IC81y = 9739988979254675501117661756328124033754844116566898604857575086084053603191;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[81] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
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
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
