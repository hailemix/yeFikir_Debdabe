//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit


class TableThree: UITableViewController{
    
    
    var detailViewController: DetailThree? = nil
    var objects = ["ይንደድ የታባቱ!","በህልሜ","ዝናሽና ክብርሽ","ዉይ አንቺ!","ኪኪኪ...","ይታየኛል ለኔ","ፍቅርን ፍለጋ"," ቆይታ","ዲቪሽ","ተዉ ሆዴ ተዉ","አይ አንተ!",
                   "እድሜሽ","ቁማሩን በልተሻል","ሰዉ እንዳለ..አወቅኩ","ፐፑፒፓ","ፍቅርሽና ፍቅሬ","ተረት","አልቻልኩም","ፍቅር ድሮ ድሮ..","ይሻለኛል",
                   "መነሻዉ..","እመጣለሁ"]
    
    let image1 = UIImage(named: "b1")
    let image2 = UIImage(named: "b2")
    let image3 = UIImage(named: "b3")
    let image4 = UIImage(named: "b4")
    let image5 = UIImage(named: "b5")
    let image6 = UIImage(named: "b6")
    let image7 = UIImage(named: "b7")
    let image8 = UIImage(named: "b8")
    let image9 = UIImage(named: "b9")
    let image10 = UIImage(named: "b10")
    let image11 = UIImage(named: "b11")
    let image12 = UIImage(named: "b12")
    let image13 = UIImage(named: "b13")
    let image14 = UIImage(named: "b14")
    let image15 = UIImage(named: "b15")
    let image16 = UIImage(named: "b16")
    let image17 = UIImage(named: "b17")
    let image18 = UIImage(named: "b18")
    let image19 = UIImage(named: "b19")
    let image20 = UIImage(named: "b20")
    let image21 = UIImage(named: "b21")
    let image22 = UIImage(named: "b22")
    
    
    
    
    var details = ["የሰከነ ፍቅር ምን ያደርግልናል?\nይልቅ ተበዳደረን ቸባ በል ቸባ በይ ሞቅ አርጊዉ  ይበጃል\nየሰከነ መዉደድ ምኑ ያዋጣናል?\nይልቅ ተቦዳድነን ብንጨፍር ይሻላል\nየሰከነ ፍቅር የቱጋ ጠቅሞናል??\nይልቅ ቅልጥ በትን ብትንትን ድርግምግም ብንል ያምርብናል\n የፍቅር ተስቦ በዚህ ዘመን ገብቶ \nአናክሶንልና ይፋፋም እሳቱ ይንደድ እንቶ ፈንቶ\nበሰከረ ፍቅር አለመስከር ከቻልን\nከመዉደድ ተስቦ ክትባት ተከትበን\nበነተበ ህይወት በዛለዉ ማንነት መኪና ገዝተናል\nፋሽናም ዘመናይ ወደፊት! ብለናል..\nኖራዉ ዘመናችን እንትናን ቀብቶ እንትን አበላሽቶ እንትን ቤቱ ሆኗል!",
                   
         "\n\n\nከንፈርሽ ላይ ሆኜ ከንፈርሽን ስሜ\nከልብሽ ዳር ሆኜ ልብሽንም ስሜ\nረብተሽኝ ሳላይ አየሁሽ በህልሜ\nሰዉ መሆኔን ጠላሁ አልገጥም ሲል ጎኔ" ,
         
         "\n\n\nመሄድሽ ነዉ በቃ ቻዎ ብዪሻለሁ\nዝናሽን ጥይቂ መልእክት አኑሬአለሁ\nእሷን ካላገኘሽ አስታዉሺ ለክብርሽ ስጠኝ\nሰው ሲሞት አፈር ነዉ ታይቶ የሚሟሽሽ...",
         
         "መዋብሽ ነዉ ነፍስሽ\nከቅርቡ ጓደኛ ከጎረቤት አፍሽ\nከሚለሳለሰዉ…ሲነኩት ከሚያምረዉ\nፀሃይ ከማይችለዉ\nቶሎ ከሚከስለዉ..ከዛ ነዉ ወደብሽ\n…\n…\nከዘር ነዉ ከዉስጥሽ\nከሩቅ ማንነትሽ…ከናትና ባትሽ\nካያት ቅድማያትሽ\nየተመዘዘ ነዉ ተንኮልና ሴራሽ!",
         "\n\n\nፍቅር ሚስጥር አለዉ በተባልኩበት ቀን\nሚስጥሩን ወርውሬ አገኘሁት ፍቅርን\nሳቅኩበት በሚስጥር….\nኪኪኪ\n...\n ኪኪኪ..\nማቆም እስከማልችል\nአይኔን ስገላልጥ ሚስጥር ሆኗል ፍቅር",
         
         "ደም ግባትሽ ሆዴ\nደም ግባትሽ ፍቅሬ\nበዘመናት ብዛት በእድሜ ሰንሰለት\nበዉጣ ዉረድ ዉስጥ በድካም በብርታት\nበእንባሽ ዉስጥ ፍቅር በሃዘንሽ ፍቅር\nበሳቅሽ ባሳብሽ በንዴት ህመምሽ\nበጣርሽ በሲቃሽ በናትነት ሆድሽ\nይታየኛል ፍቅር\nየለቅሶ ጩኸትሽ የተከዘዉ ልብሽ\nየተናቀዉና የተካደዉ እዉነት ያ ሰፊዉ አንጀትሽ\nዉበቱ ጨምሮ\nይታየኛል ፍቅር..ፍቅር ይታየኛል\nየገንዘብ ዳንኪራ የኩታራ መአት\nሆኖ ባዶ ጀብዱ ባዶ ኩራት\nዘምኖ ደስኩሮ ሲንጋጉ ተንጋግቶ\nሲሮጡ ሮጦ ለተራ ቅል ህይወት\nትዉልድ ይታየኛል ፍቅር ጠዉርሮበት\nግን አንቺ..\nግን አንቺ የኔ ዉድ\nአስጠሊታ አካሌን በፍቅር ሸፍነሽ\n ጠዉልጎ ለቀረዉ ለዚህ ችኩሉ ሰዉ በርጋታ ካጎረስሽ\nኮሌጅ ዩኒቨርሲቲ ያላስተማረኝን\nየለገስሺኝ ውዷ አስተማሪዪ ነሽ::***ኑሪልኝ***!!!!",
         
         "በአስመሳይ ዘመን ሰዉ ሁሉ ሲንጋጋ\nእኔም እንደሌላዉ ህይወቴን ሳናጋ\nዘመኑ ነጎደ ጊዜዉም በረረ\nበቀልድና በፌዝ እንዲሁ ተነነ\nግን ፀሎቴ ሰምሮ ምላሽ ዛሬ አግኝቷል\nአንቺን ለኔ ልኮ ልቤ ተረጋግቷል\nብትክደኝስ? ብዬ አስቤ ነበረ\nብተወኝስ? ብዬ ፈርቼ ነበረ\nግን…..\nልብሽን ስቃኘዉ…ስቃኘዉ…ስቃኘዉ\nስዞረዉ ስዞረዉ…ስዞረዉ\nፍቅር ፍቅር ይላል መዉደድ መዉደድ ይላል \nሌላ ምንም የለዉ!",
         
         "በፍቅር ቆይታ መዋደድ መፋቀር አስሬ መጨነቅ\n‹ዉዴ ገባህ ሰላም?› ፍቅሬ ገባሽ ሰላም?› ብሎ መጠያየቅ\nበፍቅር ቆይታ መተሳሰብ ብቻ ልዩነትን ትቶ ማሰብ ማሰላሰል ስለሌላዉ ወገን\nደስ ይላል ይደምቃል ይጥማል ይሞቃል…ግን\nፍቅር ቀሎ ሲኮነን ፣ ድንበር ሲበጅለት\n‹ከማግባቴ በፊት..› ‹ካገባሁ በኋላ..› ተብሎ ሲጠብበት\nቆይታዉ ደብዝዞ ደብዝዞ ደብዝዞ\nማንነቱን ረስቶ ሽብር ብቻ ነግሶ\n‹አንቺን ባላገባስ!› ‹አንተን ባላገኝስ›\nበሚል ባዶ እልህ አጉል ተመንድጎ በሃሳብ ኮብልሎ\nሂድ! ተብሎ ተባሮ ቀጭጮ መንኖ\nይጠፋል ላይመጣ ፍቅር ቤቱን ጥሎ!\n",
         
         "ዲቪሽ የኔ ቆንጆ ሮጠ ተለየ\nምንም ምንም ብትይ ላይመጣ መነነ\nከቶ ለምን ሄደ…?ምን ብታረጊ ነዉ እንዲህ ያመረረ..ፊቱን ያጠቆረ?\nዲቪሽማ….\nእያዘነ ሲስቅ\nእያመመዉ ሲዘልቅ…\nእጅ አልሰጥም ብሎ እግርሽን ሲከተል ፍቅርሽን ፈልጎ ባክኖ ባክኖ ሲናቅ\nዲቪሽማ…\nዉጪዉን ቁርበቱን የኪስ ማንነቱን ወደሽዉ ነበረ\nግን…\nዉስጡን አላወቅሽም ምን እንደወጣልሽ\nከቶ አልጠረጠርሽም…ዋጋዉን አልጠየክሽ ዘባተሎ መስሎሽ\n'ደሞ ለሳር ቅጠል! ደሞ ለሞላ ወንድ!' ብለሽ ተዘባብተሸ…\nቪዛዉን ሲሰጥሽ..ኪኪኪኪ…ኪኪ ሃሃሃሃ..ሃሃ! ስቀሽ\nቀዳደሽ ቦጫጭቀሽ እዛዉ ጥለሽዉ ሄድሽ!\nአልገባሽም እንጂ የኔ ምስኪን\nአልባነንሽም እንጂ ሆነሽ አይነ ስውር\nመቼም የትም ቢሆን\nየማታገኚዉን አጥተሽዋልና ልቡን የሰጠሸን\nመሬት ብትቧጥጪ ብትቀበጣጥሪ\nምክንያት ብትሰጪ ፈልስፋ ብትሆኚ\nየፍቅር አንደኛ ዲስኩር ብትከምሪ\nዲቪሸ አምልጦሻል…\nዉይ! ብሎ ተቃጥሎ..ዳግመኛ ላይመጣ ፍቅርሽን ፈልጎ\nቻዎ ብሎሽ ሄዷል!!!!",
         
         "\n\n\nከረሜላ በልተህ አትንከዉከዉ\nከጣእሙ በፊት ከወከባው በፊት\nከመምጣቱዋ በፊት\nህይወትህን አስብ\nማሩ ውስጥ መርዝ አለ ዝም ብለህ አተብት!",
         
         "አንድ 100,000 ጊዜ ሚሊየኖች ጊዜ ዐረኔ ወደድኩህ…\nወደድኩህ….\nወደድኩህ\nወደድኩህ..\n.\n.\n.\n.\n.\n.\nአሁንም ወደድኩህ\n.\nልቤን ሰጥቻለሁ ምናምን ካላልኩህ\nፍቅር የለም እንዴ መዉደድ የለም እንዴ በአፍ ሳልደሰኩር!!",
         
         "\n\n\nእድሜሽ ገና ለጋ አጨብጫቢ ከቦሽ\nእንዲህ ስትነሺ እንዲያ ስትጣቀሽ\nእንዲህ ስትቦርቂ እንዲያ ስትቷኮሽ\nበድንገት\nበድንገት\nከድሜሽ ብንን ስትይ\n አ..ቡ..ጊ..ዳ…ጀመርሽ",
         
         "‹የልጅነት ፍቅር እንዴት ይጣፍጣል\nየልብን ጥም ቆርጦ አንጀት ዉስጥ ይገባል ደም ዉስጥ ይዋኻዳል…›\nብለሽኝ ነበረ…ከንፈሬን እየሳመሽ\nአንጀቴ ዉስጥ ሆነሽ አንጀት እየበላሽ……\n‹የልጅነት ፍቅሬ አንቺ ብቻኮ ነሽ\nብተኛ ብቀመጥ ብነጉድ የትም ቦታ ልቤ ዉስጥ አዝዪሽ\nካንቺ በላይ ቆንጆ ካንቺ በላይ ተረት ይቅርብኝ ከፈለግሽ›\nብዪ ተናግሬ አልጠግብም ነበረ\nአንቺነትሽ ብቻ በትዝታ ቀረ\nእንዴት አትይኝም....!?\n‹እኔ የወደድኩት አይንህን አይደለም….ሃብትህን አይደለም..\nይህንን አይደለም….ያንንም አይደለም\nልብህን ነዉ እንጂ የማይደርቅ ለምለም….›\nብለሽኝ ነበረ ፀጉሬን እየዳበስሽ\nበሚያባብል ቅኝት ደስ በሚል ሙድ ዉስጥ በአንዴ አስገብተሸ\nቁማሩን በልተሻል ቦምቡን እረግጠሻል ጥለሽኝ ሄደሻል እቃቃ ተጫዉተሽ\nጥለሽኝ ሄደሻል\nእ……….ቃ……………ቃ…….. ተጫዉተሽ!!\n አሂሂ..እ..ህ",
         
         "\n\n\nመጦሬ ነዉ አሉ መቼ መጦር ጀመርኩ\nሲጠብቅም ሲላላም ሲከፋም ሲደላም\nሰላም እንዳላጣሁ ሰዉን እንዳላወኩ",
         
         "‹‹ቀባሪ ቀበረኝ ፍቅሬን የትም ጥሎ\nብቻዬን አስቀረኝ ቆፍሮ ቆፍሮ!››\nትይኛለሽ አሉ በ 2 ሺዎች አለም\nዘመኑ ቀፎ ነዉ የሚቆረጥ የለም\n‹‹ማር ማር››የኔ አበባ ‹‹ላቭ ላቭ›› ወድሃለሁ\nቀፎዉ ብቻ ቀርቶ ምኑን ልታገኚዉ?\nአቃርሺኝ የኔ ዉድ አመመኝ ያ ማርሽ\nቦሌ ይጠብቅሻል ምድረ በዳዉ ‹እኔ› ቅበሪዉ እባክሽ!\n‹‹ከፌስ ቡኩ ቅርሚያ ከቫይበሩ ራስጌ\nከኢሞ ና ታንጎ ከ ዋትስአቡ ግርጌ\nአፍቅሬህ ሳገኝህ ከባህር ማዶ አለም\nከዚህ ከበረሃዉ ከአረቡ ክሳት ከሞላበት አረም\nስለምን አሳቀህ የኔ ‹እኔነቴ›\nቅበረኝ በቶሎ አልፈልግም እቴ!!›› ብለሽኛል አሉ\nበአፈር ተሞልቶ የኔና የሷ ማር\nቅበረኝ ቅበሪኝ የሚል ብል በልቶናል፡፡\nእኔም በሷ ተስፋ ከበረሃዉ ርቄ\nሙቀቷን ንዳዷን በዘመኑ ቀፎ በ ‹ላቭ› ዉስጥ አምቄ\nእጠብቃታለሁ እንባዋን አስቄ!\nእጠብቃታለሁ እንባዋን አርቅቄ!",
         
         "ወድጄሽ አልጥገብ ይራብ እኔነቴ\nሆዴ ለምን ይሙላ በባዶ እቴሜቴ\nወድጄሽ ይንደዳ ይሁን ምድረ በዳ\nከፈለቀዉ ልብሽ የፍቅር አቁማዳ\nአሁንም ልጠጣ ፐፑፒፓ ይቅር ልበል አቦጊዳ\nንፁህ ይሁን እንጂ የሰጠሺኝ ፍቅር\nተረረ ረረረ ደረረ ደረረ ሰዉ ቢቀበጣጥር\nሺ ተረት ቢያወራ ፐረረ ረረረ በተራ በተራ\nሞቼም ንቅንቅ አልል!",
         
         "ፍቅርሽ የጀመረዉ ከልቤ\nሲገነባ ቆየ ካሳቤ\nፍቅርሽና ፍቅሬ አይደለም ወከባ\nሩጫ በሩጫ ክልፍልፍ ፍላጎት ሆድን የሚያባባ..ገለባ የመሰለ ጭሳጭስ አቧራ...\nፍቅርሽና ፍቅሬ አይደለም ከበሮ\nትናንት ፈንድሻ ዛሬ ደግሞ እንኩሮ \nሲደለቅ ሲመታ የሚያሰማ ሮሮ..መኖሩን ሲጠላ የሚነድ ቃጠሎ...\nፍቅርሽና ፍቅሬ አይደለም ሆሆታ \nየህፃናት እቃቃ ጨዋታ፣ የስሜት እርካታ\nየስጋ ቧልት ኳኳታ\nጭራ ሆኖ የሚያኗኑር ካርታ...\nፍቅርሽና ፍቅሬ\nጨዋ ነዉ ለዛ አለዉ\nሃዘን ነዉ ደስታ ነዉ\nልብ ነዉ ልብ አለዉ\nዛሬ ነዉ ነገም ነዉ\nኩሩ ነዉ ታዛዥ ነዉ\nእዉነትን በሃሰት የማይሸቃቅጠዉ\nግነት የሌለበት…የኔና ያንቺ ፍቅር \nይኸዉ ነዉ ይኸዉ ነዉ!",
         
         "ባንቺ ተረት ባንቺ ወሬ\nተሰድሮ የሚነበብ ትርጉም ቅኔ\nመስሎኝ ነበር…ዋጋ ያለዉ…\nየሆነዉ ሆኖ. . .\nባንቺ ተረት ባንቺ ወሬ\nተሰድሮ የሚነበብ ትርጉም ቅኔ\nመስሎኝ ነበር…ዋጋ ያለዉ መታሰቢያ ጣፋጭ ፍሬ!\nየሆነዉ ሆኖ...\nቆርጠሻል ልቶኚ ሰፌድ ሰፊ ታታሪ\nሌት ተቀን የሚለፋ ዶክተር መርማሪ...\nየማይደክመዉ ገበሬ አሳቢ....\nይገርማል!\nመቼ ይሆን የምታርፊዉ የኔ ናፍቆት\nሰፌድ ሰፍተሽ ቡና ለቅመሽ እርሻ አርሰሽ...\nእኔ አንቺን ናፍቄ ስፈልግሽ\nሳስጠራ ስከተል...ስናፍቅሰሽ....ኸረ ስንቱን ስሆንልሽ...\nማንነትሽ ማርኮኝ ነበር ደም ግባትሽ\nየሆነዉ ሆኖ...\nእኔም ልኖር ተነጥዪ\nካንቺ ፍቅር ካንቺ እይታ ሩቅ ሆኜ\nበ 100 ብር በ 50 ብር በ10 ብር በ 5 ብር ምያለሁ\n ከጓደኞችሽ ጋር ሆኜ!\n(መታሰቢያነቱ ገንዘብን ያለልክ ለሚወዱ ታማኝና እዉነተኛ ሴት አፍቃሪዎች ይሁን)",
         
         "ሰጋቱራ ፍቅርሽ ጨምሮ ጨምሮ\nእዚም እዛም ተከምሮ\nበዝቶብኛል አልቻልኩም ዘንድሮ\nአደራ..ሰጋቱራ ስድብ አይደለም\nመጥፎ ቃላት በዉስጡ አልያዘም\nግን አንቺ..\nግን አንቺ\nፍቅርሽ እዚህ እኔው ጋ\nበሰጋቱራ ተሞልቶ ሲናጋ ጋጋጋጋ\nአልቻልኩም!\nሰጋቱራ ሲያዩት ክምር\nየእንጨት ምናምንቴ አሜከላ\nግን ሲጠቀሙበት ሲፈልጉት\nየሚነድ ተቀጣጣይ የእሳት ፋና\nጊዜ የማይሰጥ ልብ ዉስጥ ዘልቆ የሚያቃጥል\nስሜት አይሉት ናፍቆት አይሉት...\nየህፃናት እቃቃ የመሰለ ምትሀት ድግምት\nሆኖብኛል እኔ አልቻልኩም\nበቃኝ በቃኝ ልኑርበት\nለብቻዬ ላልም!",
         
         "‹‹ፍቅር ድሮ ድሮ\nእንዴት ይጣፍጣል\nያሳለፍነዉ ታሪክ\nተአምራዊ ነበር!››\n.\n.\n.\n.\nይሉናል\n.\n.\n‹‹ፍቅር ድሮ ድሮ\nእንዴት ያስጎመጃል\nከብጣሽ እንጀራ በአንድ ላይ ቆርሰን\nልብ ለልብ ተሳስረን\nኖረናል ››\n.\n.\nይሉናል\n.\n.\nእኛም\n‹‹ፍቅር አሁን አሁን\nከናንተ ከ‹ድሮ› በጣም ተሻሽሎ\nእንዳሁኑ ኑሮ\nንሮ ንሮ… ተ-ወ-ዷ-ል ዘንድሮ፡፡\nበዚህ በኛ ጊዜ ፍቅር ዋጋ አለዉ\nእንደናንተ ሞትኩልህ ሞትኩልሽ\nበተወጋ ልብ ዉስጥ በቀይ ሮዝ አበባ እንዲሁ እንምነሽነሽ\nከፈለግን እንጥፋ በሌሊት እንሽሽ\nአይደለም የሞኝ ‹እሽ›፡፡\nበናንተማ ጊዜ ባ1960 ባ1970፣80፣90\nፍቅር ሰዉን ናፍቆ\nተራ ወሬ መስሎ\n‹አፍቅሬአለሁ› ማለት አፍሬአለሁ ሆ\nተረግጧል…ተፈልጧል…ተባሯል ጥንት ቆስሎ፡፡\nበዚህ በኛ እድሜ በ2000 ጓሮ\nፍቅር ዋጋ አግኝቶ መዋደድ ተከብሮ\nከመፋቀር አልፎ እላይ ጣራ ነክቶ ሲታይ ኮራ ብሎ\nፓ እንዴት ደስ ይላል ይታያል ታጅቦ!!\nኑሮ ቢሰቀል ሰማይ\nቢንጠራራ ወደላይ\nቀዳዳ በዝቶ ቢታይ\nእናንተ ብትሉም…‹አይይይ!››\nጥሩ ዜና አለን\nነገሩ እንዲህ ነዉ….\nበዚህ በኛ ዘመን ፍቅር ከንፎ ሲሄድ\nበዶላር ሲባዘት በመቶ ብር ሲነጉድ\nአቦ እንዴት ያኮራል…ጀግና ነው ይህ ትዉልድ\nፋሮች አይደለንም ክብሩን መልሰናል ሁሉንም አንድ ባንድ››\n.\n.\nእነሱም…\n‹‹እዉነታችሁን ነዉ ያስኬዳል በእርግጥ\nእኛ እንስማማለን ይመርበት ያጊጥ\nይወደድ ይጨምር ልክ እንደ አንጀራ ጤፍ ወይም እንደ ሰሊጥ፡፡\nያለበለዚያማ…\nያለበለዚያማ\nምኑ ይጣፍጣል?…የቱጋስ ያጓጓል?\nበርቱልን ጠንክሩ ከዚህ በላይ ይሁን\nብሩንና ወርቁን ያለዉን በሙሉ አዉጡና ይከመር\nማን ያዉቃል….\nማን ያዉቃል….\nኦሪጅናል ፍቅር\nየእዉነት መዋደድ\nትገዙ ይሆናል",
         
         "‹‹ፊትህን አልየዉ ዉጣልኝ በናትህ\nእኔ አልፈልግህም በቅቶኛል ዉሸትህ!››\nብለሽኛል ፍቅሬ አንጀትሽ ሳይጨክን\nከንፈርሽ ብቻዉን ተናዶ ሲናገር\nበአፍ ዱላ ብቻ ጥቂት ደም ቢያደማም\nግን አንጀትሽ ሆዴ ግን አንጀትሽ ዉዴ\nበኔ ተላላነት በኔ ክፉ ድርጊት ትርፍ አንጀት አልሆነም….ተቆርጦ አልወጣም…አልተወረወረም\n‹‹ይቅር በይኝ ፍቅሬ\nአንቺን ስለበደልኩ ስለዚያ ነገሬ››\nአልልሽም እቱ የኔ ግራ ጎኔ\n‹‹ይሄስ ንቀት በዛ…ምንድነዉ ምትለዉ?››\nትይኛለሽ ሆዴ ልብሽን አዉቃለሁ\nእንደ 2000 ወንድ ልብሴን አሳምሬ\nብንጎማለል ስሄድ ፏ ብዬ አምሬ\nልብ ተግባር ሆኖ…ካንደበት ያለፈ\nከይቅርታ በላይ ከፍ ብሎ ያረፈ\nካልሆነ ምን በጀዉ?\nከዲስኩር በስተቀር ምኑን ሊያጣፍጠዉ?\nስለዚህ...\nስለዚህ...\nይሻለኛል ለኔ እዉነት ቢቀይረዉ\nይሻለኛል ለኔ ፍቅር ቢቀይረዉ!",
         
         " \n\n\n‹ተንደርደሪ ባክሽ ከዚህ ቀድመሽ ሽሽ›\nብለኸኝ ነበረ…ከመኖርህ በፊት ዝምታህ ቸኮለ\n…እሺ ልቅደም ብዪ ተንደርድዪ ዘለልኩ\nመነሻዉን ትቼ መድረሻዉን ናፈኩ\n…ለካ ዝምታህ ዉስጥ መልስህ ተቀምጧል\n መኖርም መሞትም መነሻዉ ላይ ሆኗል!\nS ከካሳንችስ",
         
         "አንተ ለኔ እኔ ላንተ\nስንስማማ ስንጣላ\nስንፋቀር ስንባላ\nስንፈነጥዝ ስናቅራራ...\nስናስጠላ...\nአምና አለፈ ለዘንድሮ\nmiss call አርጎ ተራዉ ሆኖ...\nእኔ ላንተ አንተ ለኔ\nሙዝ ብርቱካን ሎሚ ኮሶ\nሆነህብኝ ሆኜ ›እኔ›\nዘንድሮም ሊያልፍ ነዉ\nባዶ ሆኖ ተራ ቅኔ!\nግን ሲመችህ miss call አድርግ\nበ 0911... በ0921... ወይም በሚስትህ ስልክ!\nፍቅር ተመስሎ እንደ ዱቤ ቆሎ\nበትኩሱ የሚበላ አተር ሆኖ\nበትዳርህ ይዤሃለሁ ሳይቀዘቅዝ ዝገን ቶሎ..\nእስኪሰማህ..እስኪደማህ\nእስክትነስር እስኪያስጠላህ\nደዉልልኝ እመጣለሁ\nከተመቸህ ያለህበት...ካልተመቸህ...ከሚስትህ ቤት....ከች እላለሁ!"

]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailThree
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Segues
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail3" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = details[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailThree
                controller.detailItem = object as String?
            
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3" , for: indexPath)
        let object = objects[indexPath.row]
        
        cell.textLabel!.text = object
        

        // In TableView Three,the imageView are put in switch statement
        
        switch indexPath.row {
            
        case 0:
            
            cell.imageView!.image = image1
            
        case 1:
            
            cell.imageView!.image = image2
            
        case 2:
            
            cell.imageView!.image = image3
            
        case 3:
            
            cell.imageView!.image = image4
            
        case 4:
            
            cell.imageView!.image = image5
           
        case 5:
            
            cell.imageView!.image = image6
            
        case 6:
            
            cell.imageView!.image = image7
            
        case 7:
            
            cell.imageView!.image = image8
            
        case 8:
            
            cell.imageView!.image = image9
            
        case 9:
            
            cell.imageView!.image = image10
            
        case 10:
            
            cell.imageView!.image = image11
            
        case 11:
            
            cell.imageView!.image = image12
            
        case 12:
            
            cell.imageView!.image = image13
            
        case 13:
            
            cell.imageView!.image = image14
            
        case 14:
            
            cell.imageView!.image = image15
            
        case 15:
            
            cell.imageView!.image = image16
            
        case 16:
            
            cell.imageView!.image = image17
            
        case 17:
            
            cell.imageView!.image = image18
            
        case 18:
            
            cell.imageView!.image = image19
     
        case 19:
            
            cell.imageView!.image = image20
            
        case 20:
            
            cell.imageView!.image = image21
            
        case 21:
            
            cell.imageView!.image = image22
            
        default:
            
            print("Some of the images are missing..")
            
                }
        
        return cell

    
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
}




