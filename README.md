# Ruby-on-Rails
Projekt iz predmeta Oblikovanje programske podrške

Web sjedište radio postaje.

1. Opis projektnog zadataka
Internetska radio postaja „Mi samo sviramo“ ima arhivu tonskih zapisa u nekomprimiranom
digitalnom formatu. Standardno je korištena frekvencija uzorkovanja 48 kHz uz 24 bitovnu
kvantizaciju, no postoji i manji broj zapisa gdje su korištene frekvencije uzorkovanja
44,1 kHz i 16 bitovna kvantizacija ili frekvencija uzorkovanja 96 kHz i 24 bitovna
kvantizacija. Svi su zapisi u stereo tehnici.
Internetska radio postaja traži učinkovit informacijski sustav koji će glazbenim urednicima
omogućiti kreiranje liste za reprodukciju glazbe u vremenskim odsječcima od jednog sata, do
24 sata unaprijed. Glazbeni urednik mora moći pretraživati cjelokupnu bazu po svim bitnim
informacijama vezanim uz taj zapis. Dodatno, sustav mora omogućiti registriranim
korisnicima kreiranje vlastitih lista želja s postojećim zapisima. Svaki registrirani korisnik
može sam kreirati listu s do 10 željenih zapisa. Glazbeni urednik dobiva informaciju o
zapisima koji su traženi, i prema rang listi broja zahtjeva može napraviti stvarnu listu koja će
biti emitirana. Neregistrirani korisnici vide samo informaciju o tome koji glazbeni zapis se
trenutno reproducira.Pretpostavlja se da radijska postaja ima uređena prava korištenja i
reprodukcije svih tonskih zapisa.

2. Zahtjevi na informacijski sustav
2.1. Podaci o tonskom zapisu
Svaki tonski zapis ima svoje ime, kao i ostale meta podatke, koji uključuju ime izvođača ili
grupe, trajanje zapisa, format u kojem je spremljen, frekvenciju uzorkovanja, broj bitova
kvantizacije, vrstu glazbe kamo pripada, nakladnika, vrstu nosača i godinu izdanja.
2.2. Korisnici informacijskog sustava
Informacijski sustav ima pet vrsta korisnika: vlasnik sustava, administrator, glazbeni urednik,
registrirani korisnik i neregistrirani korisnik.
Vlasnik sustava nakon puštanja sustava u produkciju, upisuje podatke o internetskoj radio
postaji i kontakt podatke. Podatke o vlasniku sustava upisuje informatička kuća koja je radila
sustav. Vlasnik sustava definira i administratore sustava. Podatke o administratorima sustava
može upisivati i mijenjati samo vlasnik sustava.
Administrator sustava može uređivati informacije o sebi, glazbenim urednicima i svim
registriranim korisnicima. Administratori sustava unosi zvučne zapise, i uređuje podatke o
njima.
Glazbene urednike određuje administrator sustava. Svaki glazbeni urednik ima svoje
određeno vrijeme u danu za koje slaže svoju listu za reprodukciju. To vrijeme određuje se
dogovorno između svih glazbenih urednika, a upisuje ga u sustav administrator sustava.
Registrirani korisnik može upisivati podatke o sebi, pri čemu obavezni podaci koje upisuje su
njegovo ime, prezime, zanimanje i adresa elektroničke pošte.
Neregistrirani korisnik može vidjeti samo osnovne podatke o internetskoj radio postaji i o
glazbenom zapisu koji se trenutno reproducira.
2.3. Posebne funkcionalnosti sustava
2.3.1. Registracija korisnika
Procedura registracije korisnika predviđa unos podataka korisnika. Nakon registracije,
korisniku se na njegovu adresu elektroničke pošte šalje pozdravna poruka i traži se potvrda
„klikom na link“. Nakon što korisnik potvrdi registraciju, na adresu elektroničke pošte šalju
mu se pristupni podaci za pristup korisničkom dijelu stranice.
2.3.2. Izrada liste za reprodukciju (glazbeni urednik)
Svaki glazbeni urednik ima na raspolaganju tražilicu koja pretražuje sve tonske zapise po
svim kriterijima. Nakon što tonski urednik odabere neki tonski zapis, on se prebacuje u
prijedlog liste, i tako sve dok se ne napravi cijela lista za 1 sat. Sustav upozorava glazbenog
urednika kad se trajanje reprodukcije liste približi trajanju od 1 sata. U cilju optimizacije
kvalitete slušanja, sustav ne dozvoljava početak reprodukcije zadnjeg tonskog zapisa ukoliko
bi njegova reprodukcija trajala manje od 15 s. Nakon izrade liste zapisa za reprodukciju,
potrebno je listu potvrditi. Nakon potvrde ona se preslikava u cjelodnevnu listu po kojoj se
radi reprodukcija. Sustav mora kontrolirati zahtjev da u svakom trenutku mora postojati lista
za reprodukciju za sljedeća 24 sata.
2.3.3. Izrada liste želja
Registrirani korisnici imaju mogućnost izrade liste želja. Registrirani korisnik može pristupiti
postojećem popisu glazbenih zapisa, i od njih odabrati 10 naslova koje bi htio čuti u sljedeća
24 sata. Nakon izrade takve liste želja, registrirani korisnik je mora potvrditi. Nakon potvrde,
sustav automatski pregledava listu, i generira listu želja sa svim zapisima koje su registrirani
korisnici unijeli, i odgovarajućim brojem zahtjeva za reprodukcijom upravo tog zapisa. Tako
generirana automatska lista želja registriranih korisnika dostupna je i vidljiva svim glazbenim
urednicima.
2.3.4. Izvještaji i pregledi
Administratori sustava mogu vidjeti izvještaje o tome koji su glazbeni zapisi koliko puta
reproducirani, koji glazbeni urednik preferira koje zapise, koji su zapisi najviše traženi preko
liste želja registriranih korisnika, i kolika je frekvencija pojavljivanja najtraženijeg zapisa sa
liste želja unutar određenog vremenskog intervala.
2.4. Ostali zahtjevi i ograničenja sustava
Sustav mora omogućiti istovremeni rad vlasnika sustava, administratora, glazbenih urednika i
neograničenog broja registriranih korisnika. Prilikom rada vlasnik i administratori sustava
moraju moći vidjeti broj i imena trenutno aktivnih drugih administratora i broj trenutno
aktivnih registriranih korisnika.
Sustav ima jednog vlasnika i do najviše 10 administratora. Broj registriranih korisnika je
neograničen.

3. Opće upute za izradu projektnog zadatka
Cilj projekta je praktično primijeniti postupke oblikovanja programske podrške na rješavanje
konkretnih problema, izraditi projektnu dokumentaciju i što stvarniju implementaciju za
traženi zadatak. Program će se ispitivati postavljanjem upita pri čemu svaki dio
implementacije mora pod određenim uvjetima biti dohvatljiv. Pri tome je bitna preglednost i
laka dostupnost funkcionalnosti i sadržaja, budući da će se sve ispitivati iz perspektive
krajnjeg korisnika sustava.
Za reprodukciju zvučnih zapisa može se koristiti bilo koji besplatni program predviđen za
reprodukciju, a primjere besplatnih nekomprimiranih zvučnih zapisa pronaći na internetu.
Detaljnija pojašnjenja moguća su na laboratorijskim vježbama kod asistenta Miljenka Krhena
(miljenko.krhen@fer.hr) i demonstratora Roka Krstulovića (roko.krstulovic@fer.hr) prema
važećem rasporedu objavljenom na stranicama predmeta.
