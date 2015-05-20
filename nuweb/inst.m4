m4_define(m4_repoversion, `0.9.02')m4_dnl
m4_dnl
m4_dnl Titles
m4_dnl
m4_define(m4_progname, `nlpp')m4_dnl
m4_define(m4_doctitle, `Standardised Dutch NLP pipeline')m4_dnl
m4_define(m4_docdate, `\today \\ m4_time_of_day~h.')m4_dnl
m4_define(m4_author, `Paul Huygen <paul.huygen@@huygen.nl>')m4_dnl
m4_define(m4_subject, `Standardised Dutch pipeline')m4_dnl
m4_dnl
m4_dnl Paths and URL's
m4_dnl
m4_dnl
m4_define(m4_aprojroot, m4_regexp(m4_esyscmd(pwd), `\(^[a-zA-Z0-9/-]+\)/nuweb$', `\1'))m4_dnl
m4_define(m4_projroot, `..')m4_dnl
m4_define(m4_abindir, m4_aprojroot`/bin')m4_dnl     Binaries
m4_define(m4_bindir, m4_projroot`/bin')m4_dnl     Binaries
m4_define(m4_amoddir, m4_aprojroot`/modules')m4_dnl     Modules
m4_define(m4_moddir, m4_projroot`/modules')m4_dnl     Modules
m4_dnl m4_define(m4_lisanlproot, /home/phuijgen/nlp)m4_dnl
m4_define(m4_snapshotrootURL, kyoto.let.vu.nl~huygen/dutch_snapshots)m4_dnl
m4_define(m4_asnapshotroot, m4_aprojroot/snapshots)m4_dnl
m4_define(m4_snapshotroot, m4_projroot/snapshots)m4_dnl
m4_dnl
m4_dnl HTML doc generation
m4_define(m4_htmldocdir, m4_projroot/nuweb/html)m4_dnl . You can change this in a local m4 file.
m4_define(m4_ahtmldocdir, m4_aprojroot/nuweb/html)m4_dnl
m4_define(m4_bibfil, m4_progname`'.bib)m4_dnl
m4_define(m4_htmltarget, m4_htmldocdir/`'m4_progname.html`')m4_dnl
m4_define(m4_htmlsource, m4_htmldocdir/`'m4_progname.w`')m4_dnl
m4_define(m4_4ht_template, artikel3.4ht)m4_dnl
m4_define(m4_html_style, html.sty)m4_dnl
m4_define(m4_4htsource, m4_htmldocdir/`'m4_progname.w`')m4_dnl
m4_dnl
m4_dnl Programming environment
m4_dnl
m4_define(m4_aenvdir, m4_aprojroot`/env')m4_dnl     Program environment
m4_define(m4_envdir, m4_projroot`/env')m4_dnl 
m4_define(m4_usrlocaldir, m4_envdir`/usrlocal')m4_dnl     
m4_define(m4_ausrlocaldir, m4_aenvdir`/usrlocal')m4_dnl
m4_define(m4_ausrlocalbindir, m4_ausrlocaldir/bin')m4_dnl
m4_define(m4_ajavadir, m4_aenvdir`/java')m4_dnl   
m4_define(m4_javadir, m4_envdir`/java')m4_dnl     
m4_define(m4_ajardir, m4_ajavadir`/jars')m4_dnl     jars
m4_define(m4_jardir, m4_javadir`/jars')m4_dnl     jars
m4_define(m4_javatarball, server-jre-7u72-linux-x64.tar.gz)m4_dnl
m4_define(m4_javatarballurl, http://www.oracle.com/technetwork/java/javase/downloads/server-jre7-downloads-1931105.html)m4_dnl
m4_define(m4_javajdk, jdk1.7.0_72)m4_dnl
m4_define(m4_ahackdir, m4_aenvdir`/hacks')m4_dnl
m4_define(m4_apythonenvdir, m4_aenvdir/python)m4_dnl
m4_define(m4_pythonenvdir, m4_envdir/python)m4_dnl
m4_dnl
m4_dnl Maven
m4_dnl
m4_define(m4_mavenversion, `3.0.5')m4_dnl
m4_define(m4_mavendir, m4_aenvdir/apache-maven-`'m4_mavenversion)m4_dnl
m4_define(m4_maventarball, apache-maven-`'m4_mavenversion`'-bin.tar.gz)m4_dnl
m4_define(m4_maventarballurl, http://apache.rediris.es/maven/maven-3/`'m4_mavenversion`'/binaries/`'m4_maventarball)m4_dnl
m4_define(m4_maven_javaversion, 1.7)m4_dnl

m4_dnl boost libs
m4_define(m4_boostname, boost_1_54_0)m4_dnl
m4_define(m4_boosttarball, m4_boostname.tar.bz2)m4_dnl
m4_define(m4_boost_src_url, http://downloads.sourceforge.net/project/boost/boost/1.54.0/`'m4_boosttarball)m4_dnl
m4_define(m4_pythonmoddir, m4_amoddir/python)m4_dnl
m4_dnl
m4_dnl Module installer
m4_dnl
m4_define(m4_module_installer, install-modules)m4_dnl
m4_dnl
m4_dnl Snapshot repo
m4_dnl m4_define(m4_snapshot_tarball, nl-pipeline_snapshots_20150127.tgz)m4_dnl
m4_dnl m4_define(m4_snapshot_tarball, nl-pipeline_snapshots_20150220.tgz)m4_dnl
m4_dnl m4_define(m4_snapshot_tarball, nl-pipeline_snapshots_20150309.tgz)m4_dnl
m4_define(m4_snapshot_tarball, nl-pipeline_snapshots_20150420.tgz)m4_dnl
m4_define(m4_snapshotdir, snapshots)m4_dnl
m4_dnl
m4_dnl EHU repo
m4_define(m4_ehu_rep_url, u017940.si.ehu.es)m4_dnl
m4_define(m4_ehu_rep_port, 2223)m4_dnl
m4_define(m4_ehu_modules_directory, components)m4_dnl
m4_define(m4_ehu_user, newsreader)m4_dnl

m4_dnl Modules
m4_dnl
m4_dnl Tokenizer
m4_dnl m4_define(m4_tokenizergit, https://github.com/opener-project/tokenizer-base.git)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_tokenizerdir, tokenizer-base)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_tokenizerscript, tok)m4_dnl
m4_dnl m4_define(m4_tokenizerversion, `1.7.0')m4_dnl
m4_dnl m4_define(m4_tokenizerversion, `1.7.4')m4_dnl
m4_define(m4_tokenizerversion, `1.8.0')m4_dnl
m4_dnl m4_define(m4_tokenizer_commitname, c4d307eece4ef19aca365e3a08abd7f3324e3707)m4_dnl
m4_dnl m4_define(m4_tokenizer_commitname, 410a97ba4a847d4dfea6a45b9ae09f4bfbbfdc5a)m4_dnl
m4_define(m4_tokenizer_commitname, 56f83ce4b61680346f15e5d4e6de6293764f7383)m4_dnl
m4_define(m4_tokenizergit, https://github.com/ixa-ehu/ixa-pipe-tok.git)m4_dnl  Subdir. of modules
m4_define(m4_tokenizerdir, ixa-pipe-tok)m4_dnl  Subdir. of modules
m4_define(m4_tokenizerjar, ixa-pipe-tok-`'m4_tokenizerversion.jar)m4_dnl
m4_define(m4_tokenizerscript, tok)m4_dnl
m4_dnl
m4_dnl Morphosyntactic parser
m4_define(m4_morphpargit, https://github.com/cltl/morphosyntactic_parser_nl.git)m4_dnl  Subdir. of modules
m4_define(m4_morphpar_commitname, `c6cabea2cc37ac3098c5927f5ec5b180ac31246f')m4_dnl
m4_define(m4_morphpardir, morphosyntactic_parser_nl)m4_dnl  Subdir. of modules
m4_define(m4_morphparscript, mor)m4_dnl
m4_dnl
m4_dnl Alpino_hack
m4_dnl
m4_define(m4_alpinohackdir, alpinohack)m4_dnl
m4_define(m4_alpinohackscript, alpinohack)m4_dnl
m4_define(m4_alpinohackpythonscript, clean_hack.py)m4_dnl
m4_dnl
m4_dnl NERC
m4_dnl
m4_define(m4_nercgit, https://github.com/ixa-ehu/ixa-pipe-nerc)m4_dnl
m4_dnl m4_define(m4_nerc_commitname, 8b518284eface454a4f954dfb88bea4d98b2073a)m4_dnl
m4_define(m4_nerc_commitname, 9927fdb32d943f0aa9748a656958af99eeb1f5b7)m4_dnl
m4_define(m4_nercdir, EHU-nerc)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_nercversion, 1.3.3)m4_dnl
m4_define(m4_nercversion, 1.3.6)m4_dnl
m4_define(m4_nercjar, ixa-pipe-nerc-`'m4_nercversion`'.jar)m4_dnl
m4_define(m4_nercmodeldir, nerc-resources)m4_dnl
m4_dnl m4_define(m4_nercmodel, nl-local-conll02-testa.bin)m4_dnl
m4_define(m4_nercmodelconll02, nl-clusters-conll02.bin)m4_dnl
m4_define(m4_nercmodelsonar, nl-clusters-sonar.bin)m4_dnl
m4_define(m4_nercscript, nerc)m4_dnl
m4_define(m4_nerc_conll02_script, nerc_conll02)m4_dnl
m4_define(m4_nerc_sonar_script, nerc_sonar)m4_dnl
m4_dnl
m4_dnl Coreference-base
m4_dnl
m4_define(m4_corefbasedir, coreference-base)m4_dnl  Subdir. of modules
m4_define(m4_corefbasescript, coreference-base)m4_dnl
m4_define(m4_corefbasegit, https://github.com/opener-project/coreference-base.git)m4_dnl
m4_define(m4_corefbase_commitname, `bfa5aec0fa498e57fe14dd4d2c51365dd09a0757')m4_dnl


m4_dnl
m4_dnl LU2SYN
m4_dnl
m4_define(m4_lu2syndir, lexicalunitconvertor)m4_dnl
m4_define(m4_lu2synsetscript, lu2synset)m4_dnl
m4_dnl NED
m4_define(m4_ned_version, 1.1.1)m4_dnl
m4_define(m4_nedgit, https://github.com/ixa-ehu/ixa-pipe-ned.git)m4_dnl
m4_define(m4_ned_commitname, d35d4df5cb71940bf642bb1a83e2b5b7584010df)m4_dnl  
m4_define(m4_neddir, ixa-pipe-ned)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_nedjar, ixa-pipe-ned-1.0.jar)m4_dnl
m4_define(m4_nedjar, ixa-pipe-ned-`'m4_ned_version`'.jar)m4_dnl
m4_define(m4_nedspotmodel_nl_tarball, nl.tar.gz)m4_dnl
m4_define(m4_nedspotmodel_nl_url, http://spotlight.sztaki.hu/downloads/`'m4_nedspotmodel_nl_tarball)m4_dnl
 
m4_define(m4_nedscript, ned)m4_dnl
m4_define(m4_wikipediadbmodule, wikipedia-db)m4_dnl
m4_define(m4_wikipediadbmodule_url, http://ixa2.si.ehu.es/ixa-pipes/models/`'wikipediamodule`'.v1.tar.gz)m4_dnl
m4_dnl
m4_dnl WSD
m4_dnl m4_define(m4_wsdsrc, m4_lisanlproot/mods/ukb)m4_dnl  Subdir. of modules
m4_define(m4_wsdgit, https://github.com/cltl/svm_wsd.git)m4_dnl
m4_define(m4_wsd_commitname, `2babeb40a81b3720274a0521ccc2a27c5eff28c9')m4_dnl
m4_define(m4_wsddir, svm_wsd)m4_dnl
m4_define(m4_wsdscript, wsd)m4_dnl
m4_dnl
m4_dnl ONTO
m4_define(m4_ontodir, vua-ontotagger-v1.0)m4_dnl  Subdir. of modules
m4_define(m4_ontoscript, onto)m4_dnl
m4_define(m4_ontotarball, vua-ontotagger-v1.0.tar.gz)m4_dnl  Subdir. of modules
m4_dnl
m4_dnl Framenet SRL
m4_define(m4_ontodir, vua-ontotagger-v1.0)m4_dnl  Subdir. of modules
m4_define(m4_framesrlscript, framesrl)m4_dnl
m4_define(m4_ontotarball, vua-ontotagger-v1.0.tar.gz)m4_dnl  Subdir. of modules

m4_dnl
m4_dnl Heideltime
m4_dnl m4_define(m4_heidelsrc, m4_lisanlproot/mods/HeidelTimeModule)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_heideldir, HeidelTimeModule)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_heidelscript, heideltime)m4_dnl
m4_define(m4_heidelgit, https://github.com/cltl/NAF-HeidelTime.git)m4_dnl  Subdir. of modules
m4_define(m4_heidel_commitname, 057c93ccc857a427145b9e2ff72fd645172d34df)m4_dnl
m4_dnl m4_define(m4_heidelgit, `git@@github.com:PaulHuygen/NAF-HeidelTime.git' )m4_dnl  Subdir. of modules
m4_define(m4_heideldir, NAF-HeidelTime)m4_dnl  Subdir. of modules
m4_define(m4_heidelscript, heideltime)m4_dnl
m4_dnl
m4_dnl SRL
m4_define(m4_srlgit, `https://github.com/newsreader/vua-srl-nl.git' )m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_srl_commitname, a5e63ba512cc326274b1285cf2af81ff8a2e04b5)m4_dnl
m4_define(m4_srl_commitname, 675d22d361289ede23df11dcdb17195f008c54bf)m4_dnl
m4_define(m4_srlsrc, m4_asnapshotroot/srlModuleForBN)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_srldir, srlModuleForBN)m4_dnl  Subdir. of modules
m4_define(m4_srldir, vua-srl-nl)m4_dnl  Subdir. of modules
m4_define(m4_srlscript, srl)m4_dnl
m4_dnl
m4_dnl Nom. coref
m4_define(m4_ncorefsrc, /dev/null )m4_dnl  Subdir. of modules
m4_define(m4_ncorefdir, nomcoref)m4_dnl  Subdir. of modules
m4_define(m4_ncorefscript, nomcoref)m4_dnl
m4_dnl
m4_dnl Ev. coref
m4_define(m4_evcorefdir, vua-eventcoreference_v2)m4_dnl  Subdir. of modules
m4_define(m4_evcoreftarball, m4_evcorefdir.tar.gz)m4_dnl
m4_define(m4_evcorefscript, evcoref)m4_dnl
m4_define(m4_evcorefjar, EventCoreference-1.0-SNAPSHOT-jar-with-dependencies.jar)m4_dnl

m4_dnl
m4_dnl Opinion-miner
m4_define(m4_opinisrc, /dev/null )m4_dnl  Subdir. of modules
m4_define(m4_opinidir, opinimin)m4_dnl  Subdir. of modules
m4_define(m4_opiniscript, opinimin)m4_dnl
m4_dnl
m4_dnl Framenet Semantic Role Labeler
m4_define(m4_fsrlsrc, /dev/null )m4_dnl  Subdir. of modules
m4_define(m4_fsrldir, fsrl)m4_dnl  Subdir. of modules
m4_define(m4_fsrlscript, fsrl)m4_dnl
m4_dnl
m4_dnl Utilities
m4_dnl
m4_dnl
m4_dnl Alpino
m4_define(m4_alpino_version, 20706)m4_dnl
m4_define(m4_alpinosrc, Alpino-x86_64-linux-glibc2.5-`'m4_alpino_version`'-sicstus.tar.gz)
m4_define(m4_alpinourl, http://www.let.rug.nl/vannoord/alp/Alpino/binary/versions/m4_alpinosrc)m4_dnl  
m4_define(m4_alpino_desc_url, http://www.let.rug.nl/~vannoord/alp/Alpino/)m4_dnl
m4_define(m4_alpinodir, Alpino)m4_dnl  Subdir. of modules
m4_define(m4_Alpinoscript, alpino)m4_dnl
m4_dnl
m4_dnl Timbl
m4_dnl m4_define(m4_timblsrc, http://ilk.uvt.nl/timbl/download-timbl.php)m4_dnl
m4_define(m4_timblversion, 6.4.6)m4_dnl
m4_define(m4_timblsrc,  timbl-`'m4_timblversion`'.tar.gz)m4_dnl
m4_define(m4_timblurl,  http://software.ticc.uvt.nl/m4_timblsrc`')m4_dnl
m4_define(m4_timbldir, timbl-m4_timblversion)m4_dnl  Subdir. of modules
m4_define(m4_timbl_description_url, http://ilk.uvt.nl/timbl)m4_dnl
m4_dnl m4_define(m4_timblscript, )m4_dnl
m4_dnl
m4_dnl Ticcutils
m4_define(m4_ticcutilsversion, 0.7)m4_dnl
m4_define(m4_ticcsrc, ticcutils-`'m4_ticcutilsversion`'.tar.gz)m4_dnl
m4_define(m4_ticcurl, http://software.ticc.uvt.nl/`'m4_ticcsrc`')m4_dnl
m4_define(m4_ticcdir, ticcutils-`'m4_ticcutilsversion`')m4_dnl
m4_define(m4_ticc_desc_url, http://ilk.uvt.nl/ticcutils)m4_dnl
m4_dnl
m4_dnl KafNafParserPy
m4_define(m4_kafnafversion, `feb 1, 2015')m4_dnl
m4_define(m4_kafnafgit, https://github.com/cltl/KafNafParserPy.git)m4_dnl
m4_define(m4_kafnafdir, python/KafNafParserPy)m4_dnl
m4_dnl
m4_dnl Treetagger
m4_define(m4_treetag_base_url, `http://www.cis.uni-muenchen.de/%7Eschmid/tools/TreeTagger/data/')m4_dnl
m4_define(m4_treetag_version, 3.2)m4_dnl
m4_define(m4_treetagsrc, tree-tagger-linux-3.2.tar.gz)m4_dnl
m4_define(m4_treetag_dutchparms, dutch-par-linux-3.2-utf8.bin.gz)m4_dnl
m4_define(m4_treetag_dutchparms2, dutch2-par-linux-3.2-utf8.bin.gz)m4_dnl
m4_define(m4_treetag_dutch_tagset, dutch-tagset.txt)m4_dnl
m4_define(m4_treetagger_scripts, tagger-scripts.tar.gz)m4_dnl
m4_define(m4_treetagger_installscript, install-tagger.sh)m4_dnl
m4_define(m4_treetagger-main-webpage, `http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/')m4_dnl


m4_define(m4_treetagurl, `http://www.cis.uni-muenchen.de/%7Eschmid/tools/TreeTagger/data/m4_treetagsrc')m4_dnl
m4_define(m4_treetag_dutchabburl, http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/dutch-par-linux-3.2-utf8.bin.gz)m4_dnl
m4_define(m4_treetagdir, treetagger)m4_dnl
m4_dnl
m4_dnl Spotlight
m4_dnl
m4_define(m4_spotlight_nl_port, 2060)m4_dnl
m4_define(m4_aspotlightdir, m4_aenvdir/spotlight)m4_dnl
m4_define(m4_spotlighturl, http://spotlight.sztaki.hu)m4_dnl
m4_define(m4_spotlight_download_url, m4_spotlighturl/downloads)m4_dnl
m4_define(m4_spotlightjarversion, 0.7)m4_dnl
m4_define(m4_simple_spotlightjar, dbpedia-spotlight-`'m4_spotlightjarversion`'.jar)m4_dnl
m4_define(m4_spotlightjar, dbpedia-spotlight-`'m4_spotlightjarversion`'-jar-with-dependencies-candidates.jar)m4_dnl
m4_define(m4_spotlight_nl_model, nl.tar.gz)m4_dnl
m4_define(m4_spotlight_nl_port, 2060)m4_dnl
m4_define(m4_spotlight_en_model, en_2+2.tar.gz)m4_dnl
m4_define(m4_spotlight_en_port, 2020)m4_dnl
m4_dnl
m4_dnl Wikipedia db
m4_dnl
m4_define(m4_wikipediadb_tarball, wikipedia-db.v1.tar.gz)m4_dnl
m4_define(m4_wikipediadb_url, http://ixa2.si.ehu.es/ixa-pipes/models/m4_wikipediadb_tarball)m4_dnl
m4_define(m4_wikipediadb_tarball, wikipedia-db.v1.tar.gz)m4_dnl


m4_define(m4_spotlight_snapdir, spotlight)m4_dnl
m4_define(m4_spotlight_dir, spotlight)m4_dnl

m4_dnl
m4_dnl Locations of programs and system-dependent definitions
m4_dnl
m4_define(m4_mkportbib, `/home/paul/bin/mkportbib')m4_dnl
m4_define(m4_printpdf, `lpr '$1`.pdf')m4_dnl
m4_define(m4_viewpdf, `evince '$1`.pdf')m4_dnl
m4_define(m4_latex, `pdflatex '$1)m4_dnl
m4_define(m4_nuwebbinary, `m4_ausrlocalbindir/nuweb')m4_dnl
m4_dnl m4_define(m4_nuwebbinary, m4_esyscmd(which nuweb))m4_dnl
m4_dnl
m4_dnl    subdirs 
m4_dnl
m4_define(m4_abindir, m4_aprojroot`/bin')m4_dnl     Binaries
m4_define(m4_bindir, m4_projroot`/bin')m4_dnl     Binaries
m4_dnl
m4_dnl    miscellaneous
m4_dnl
m4_define(m4_walltime, 30:00)m4_dnl   Max duration of a job



m4_dnl
m4_dnl internal URL's and their templates
m4_dnl 
m4_dnl
m4_dnl Commands
m4_dnl
m4_define(m4_printpdf, `lpr '$1`.pdf')m4_dnl
m4_dnl
m4_dnl bibliography (bib files that can be reached with kpesewhich, without .bib extension)
m4_dnl
m4_define(m4_bibliographies, `litprog')m4_dnl
m4_dnl
m4_dnl external URL's
m4_dnl 
m4_define(m4_nuwebURL, `nuweb.sourceforge.net')m4_dnl
m4_dnl m4_define(m4_nuweb_download_url, `http://downloads.sourceforge.net/project/nuweb/nuweb-1.58.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fnuweb%2Ffiles%2F&ts=1413975392&use_mirror=softlayer-ams')m4_dnl
m4_define(m4_nuwebsource, nuweb-1.58)m4_dnl
m4_define(m4_nuweb_download_url, http://kyoto.let.vu.nl/~huygen/`'m4_nuwebsource`'.tgz)m4_dnl
m4_dnl
m4_dnl Miscellaneous
m4_dnl
m4_dnl
m4_dnl max times to compile with LaTeX.
m4_dnl
m4_define(m4_maxtexloops, `10')m4_dnl
m4_dnl
m4_dnl (style) things that probably do not have to be modified
m4_dnl
m4_changequote(`<!',`!>')m4_dnl
m4_define(m4_header, <!m4_esyscmd(date +'%Y%m%d at %H%Mh'| tr -d '\012'): Generated by nuweb from a_!>m4_progname<!.w!>)
m4_define(m4_time_of_day, <!m4_esyscmd(date +'%H:%M'| tr -d '\012')!>)m4_dnl
m4_define(m4_index4ht, <!tex '\def\filename{{!>m4_progname<!}{idx}{4dx}{ind}} \input idxmake.4ht'!>)m4_dnl
m4_define(m4_nuwebbindir, <!m4_projroot!>/nuweb/bin)m4_dnl
