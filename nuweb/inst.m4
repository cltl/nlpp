m4_define(m4_repoversion, `1.1.00')m4_dnl
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
m4_define(m4_asocket, m4_regexp(m4_esyscmd(pwd), `\(^[a-zA-Z0-9/-]+\)/nlpp/nuweb$', `\1'))m4_dnl
m4_define(m4_projroot, `..')m4_dnl
m4_define(m4_abindir, m4_aprojroot`/bin')m4_dnl     Binaries
m4_define(m4_bindir, m4_projroot`/bin')m4_dnl     Binaries
m4_define(m4_amoddir, m4_aprojroot`/modules')m4_dnl     Modules
m4_define(m4_moddir, m4_projroot`/modules')m4_dnl     Modules
m4_define(m4_modulelist, m4_aprojroot/installed_modules)m4_dnl

m4_dnl m4_define(m4_lisanlproot, /home/phuijgen/nlp)m4_dnl
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
m4_define(m4_aenvbindir, m4_aenvdir`'/bin)m4_dnl     Program environment
m4_define(m4_envbindir, m4_envdir`'/bin)m4_dnl 
m4_define(m4_aenvlibdir, m4_aenvdir`'/lib)m4_dnl     Program environment
m4_define(m4_envlibdir, m4_envdir`'/lib)m4_dnl 
m4_define(m4_aenvetcdir, m4_aenvdir`'/etc)m4_dnl 
m4_define(m4_envetcdir, m4_envdir`'/etc)m4_dnl 
m4_dnl     m4_define(m4_usrlocaldir, m4_envdir`/usrlocal')m4_dnl     
m4_dnl     m4_define(m4_ausrlocaldir, m4_aenvdir`/usrlocal')m4_dnl
m4_dnl     m4_define(m4_usrlocalbindir, m4_usrlocaldir/bin)m4_dnl
m4_dnl     m4_define(m4_ausrlocalbindir, m4_ausrlocaldir/bin)m4_dnl
m4_define(m4_ajavadir, m4_aenvdir`/java')m4_dnl   
m4_define(m4_javadir, m4_envdir`/java')m4_dnl     
m4_define(m4_ajardir, m4_ajavadir`/jars')m4_dnl     jars
m4_define(m4_jardir, m4_javadir`/jars')m4_dnl     jars
m4_define(m4_javatarball, server-jre-7u72-linux-x64.tar.gz)m4_dnl
m4_define(m4_javatarballurl, http://www.oracle.com/technetwork/java/javase/downloads/server-jre7-downloads-1931105.html)m4_dnl
m4_define(m4_javajdk, jdk1.7.0_72)m4_dnl
m4_define(m4_ahackdir, m4_aenvdir`/hacks')m4_dnl
m4_define(m4_activepythonurl, http://www.activestate.com/activepython)m4_dnl
m4_define(m4_activepythonball, ActivePython-2.7.8.10-linux-x86_64.tar.gz)m4_dnl
m4_define(m4_apythonenvdir, m4_aenvdir/python)m4_dnl
m4_define(m4_pythonenvdir, m4_envdir/python)m4_dnl
m4_dnl
m4_dnl snapshot
m4_dnl
m4_define(m4_repo_url, kyoto.let.vu.nl)m4_dnl
m4_define(m4_repo_user, newsreader)m4_dnl
m4_define(m4_snapshotkeyfilename, nrkey)m4_dnl
m4_define(m4_snapshotkeyfile, m4_asocket/nrkey)m4_dnl
m4_dnl m4_define(m4_snapshotrootURL, kyoto.let.vu.nl~huygen/dutch_snapshots)m4_dnl
m4_define(m4_snapshotrootURL, newsreader@@kyoto.let.vu.nl)m4_dnl
m4_define(m4_snapshotdirectory, t_nlpp_resources)m4_dnl
m4_define(m4_snapshotsocket, m4_asocket)m4_dnl
m4_define(m4_asnapshotroot, m4_aprojroot/snapshots)m4_dnl
m4_define(m4_snapshotroot, m4_projroot/snapshots)m4_dnl
m4_define(m4_enrepo_url, u017940.si.ehu.es)m4_dnl
m4_define(m4_enrepo_port, 2223)m4_dnl
m4_define(m4_enrepo_user, newsreader)m4_dnl
m4_define(m4_enrepo_dir, components)m4_dnl


m4_dnl
m4_dnl Maven
m4_dnl
m4_define(m4_mavenurl, `https://maven.apache.org')m4_dnl
m4_define(m4_mavenversion, `3.0.5')m4_dnl
m4_define(m4_mavensubdir, apache-maven-`'m4_mavenversion)m4_dnl
m4_define(m4_mavendir,   m4_envdir/m4_mavensubdir)m4_dnl
m4_define(m4_amavendir, m4_aenvdir/m4_mavensubdir)m4_dnl
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
m4_dnl Topic detection tool
m4_define(m4_topictooldir, EHU-topic.v30)m4_dnl
m4_dnl
m4_dnl Pos tagger
m4_define(m4_posdir, EHU-pos.v30)m4_dnl
m4_dnl
m4_dnl Morphosyntactic parser
m4_define(m4_morphpargit, https://github.com/cltl/morphosyntactic_parser_nl.git)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_morphpar_commitname, `c6cabea2cc37ac3098c5927f5ec5b180ac31246f')m4_dnl
m4_define(m4_morphpar_commitname, `807e938ce4ebb71afd9d7c7f42d9d9ac5f98a184')m4_dnl
m4_define(m4_morphpardir, morphosyntactic_parser_nl)m4_dnl  Subdir. of modules
m4_define(m4_morphparscript, mor)m4_dnl
m4_dnl
m4_dnl Alpino_hack
m4_dnl
m4_define(m4_alpinohackdir, alpinohack)m4_dnl
m4_define(m4_alpinohackscript, alpinohack)m4_dnl
m4_define(m4_alpinohackpythonscript, clean_hack.py)m4_dnl
m4_dnl
m4_dnl Constituent parser
m4_define(m4_conspardir, EHU-parse.v30)m4_dnl

m4_dnl
m4_dnl NERC
m4_dnl
m4_define(m4_nercgit, https://github.com/ixa-ehu/ixa-pipe-nerc)m4_dnl
m4_define(m4_nerc_commitname, 5cacac28fcaa6e91d5f2a4cc9b486b24ac163641)m4_dnl
m4_dnl m4_define(m4_nerc_commitname, ca02c931bc0b200ccdb8b5795a7552e4cc0d4802)m4_dnl (20151215)
m4_define(m4_EHU_nercdir, EHU-nerc.v30)m4_dnl  Subdir. of modules
m4_define(m4_nercdir, nerc-models)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_nercversion, 1.3.3)m4_dnl
m4_dnl m4_define(m4_nercversion, 1.3.6)m4_dnl
m4_define(m4_nercversion, 1.5.2)m4_dnl
m4_define(m4_nercjar, ixa-pipe-nerc-`'m4_nercversion`'.jar)m4_dnl
m4_define(m4_nercmodeldir, nerc-resources)m4_dnl
m4_dnl m4_define(m4_nercmodel, nl-local-conll02-testa.bin)m4_dnl
m4_define(m4_nercmodelconll02, nl-clusters-conll02.bin)m4_dnl
m4_define(m4_nercmodelsonar, nl-clusters-sonar.bin)m4_dnl
m4_define(m4_nercmodelen, en-newsreader-clusters-3-class-muc7-conll03-ontonotes-4.0.bin)m4_dnl
m4_define(m4_nercscript, nerc)m4_dnl
m4_define(m4_nerc_conll02_script, nerc_conll02)m4_dnl
m4_define(m4_nerc_sonar_script, nerc_sonar)m4_dnl
m4_dnl m4_define(m4_nercmodelsball, EHU-nerc.tgz)m4_dnl
m4_define(m4_nercmodelsball, nerc-models-nl.tgz)m4_dnl
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
m4_dnl m4_define(m4_nedspotmodel_nl_url, http://spotlight.sztaki.hu/downloads/`'m4_nedspotmodel_nl_tarball)m4_dnl
m4_dnl m4_define(m4_ned_version, 1.1.4)m4_dnl
m4_dnl m4_define(m4_nedgit, https://github.com/ixa-ehu/ixa-pipe-ned.git)m4_dnl
m4_dnl m4_define(m4_ned_commitname, a1787f2996ec90c6ef82356a971808c8b44227df)m4_dnl  
m4_dnl m4_define(m4_neddir, ixa-pipe-ned)m4_dnl  Subdir. of modules
m4_dnl m4_dnl m4_define(m4_nedjar, ixa-pipe-ned-1.0.jar)m4_dnl
m4_dnl m4_define(m4_nedjar, ixa-pipe-ned-`'m4_ned_version`'.jar)m4_dnl
m4_dnl m4_define(m4_nedspotmodel_nl_tarball, nl.tar.gz)m4_dnl
m4_define(m4_nedspotmodel_nl_url, http://spotlight.sztaki.hu/downloads/`'m4_nedspotmodel_nl_tarball)m4_dnl
 
m4_define(m4_nedscript, ned)m4_dnl
m4_define(m4_wikipediadbmodule, wikipedia-db)m4_dnl
m4_define(m4_wikipediadbmodule_url, http://ixa2.si.ehu.es/ixa-pipes/models/`'wikipediamodule`'.v1.tar.gz)m4_dnl
m4_dnl
m4_dnl WSD
m4_dnl m4_define(m4_wsdsrc, m4_lisanlproot/mods/ukb)m4_dnl  Subdir. of modules
m4_define(m4_wsdgit, https://github.com/cltl/svm_wsd.git)m4_dnl
m4_define(m4_wsd_commitname, `030043903b42f77cd20a9b2443de137e2efe8513')m4_dnl
m4_dnl m4_define(m4_wsd_commitname, `2babeb40a81b3720274a0521ccc2a27c5eff28c9')m4_dnl
m4_define(m4_wsddir, svm_wsd)m4_dnl
m4_define(m4_wsdscript, wsd)m4_dnl
m4_define(m4_wsd_snapball, svm_wsd.tgz)m4_dnl
m4_dnl
m4_dnl ONTO
m4_define(m4_ontodir, vua-ontotagger-v1.0)m4_dnl  Subdir. of modules
m4_define(m4_ontoscript, onto)m4_dnl
m4_dnl m4_define(m4_ontotarball, 20150724_vua-ontotagger-v1.0.tar.gz)m4_dnl  Subdir. of modules
m4_define(m4_ontotarball, 20151217_vua-ontotagger-v1.0.tgz)m4_dnl  Subdir. of modules
m4_dnl
m4_dnl Framenet SRL
m4_define(m4_ontodir, vua-ontotagger-v1.0)m4_dnl  Subdir. of modules
m4_define(m4_framesrlscript, framesrl)m4_dnl
m4_define(m4_ontotarball, vua-ontotagger-v1.0.tar.gz)m4_dnl  Subdir. of modules

m4_dnl
m4_dnl Heideltime
m4_dnl
m4_dnl m4_define(m4_heidelsrc, m4_lisanlproot/mods/HeidelTimeModule)m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_heideldir, HeidelTimeModule)m4_dnl 
m4_dnl m4_define(m4_heidelscript, heideltime)m4_dnl
m4_define(m4_heideldir, ixa-pipe-time)m4_dnl
m4_define(m4_heidelgit, https://github.com/ixa-ehu/ixa-pipe-time.git)m4_dnl
m4_define(m4_heidelhtml, https://github.com/ixa-ehu/ixa-pipe-time)m4_dnl
m4_define(m4_heidel_commitname, da4604a7b33975e977017440cbc10f7d59917ddf)m4_dnl
m4_define(m4_heidelscript, heideltime)m4_dnl
m4_define(m4_heidelstandalonejar, de.unihd.dbs.heideltime.standalone.jar)m4_dnl
m4_define(m4_heidelantske, 20151123_antske_heideltime_stuff.tgz)m4_dnl
m4_dnl
m4_dnl New Heideltime
m4_define(m4_heidelndir, ixa-pipe-time)m4_dnl
m4_define(m4_heidelnball, ixa-pipe-time.tgz)m4_dnl
m4_define(m4_heidelngit, https://github.com/ixa-ehu/`'m4_heidelndir`'.git)m4_dnl
m4_define(m4_heidelncommitname, 2a2999bb6558401326bf88bda44e9a9c404492c6)m4_dnl
m4_define(m4_heidelnstandaloneball, `D6lUEN')m4_dnl
m4_define(m4_heidelnstandaloneurl, `http://goo.gl/m4_heidelnstandaloneball')m4_dnl
m4_define(m4_heidelnstandalonejar, `de.unihd.dbs.heideltime.standalone.jar')m4_dnl
m4_define(m4_installtoprojectgit, https://github.com/carchrae/install-to-project-repo.git)m4_dnl
m4_define(m4_installtoprojectpy, install-to-project-repo.py)m4_dnl
m4_define(m4_installtoprojectpyurl, https://github.com/carchrae/install-to-project-repo/blob/master/m4_installtoprojectpy)m4_dnl
m4_define(m4_mappingsfile, eagles-to-treetager.csv)m4_dnl
m4_define(m4_mappingsfileurl, http://ixa2.si.ehu.es/~jibalari/eagles-to-treetager.csv)m4_dnl
m4_define(m4_heidel_mvn_localdir, `$HOME/.m2/repository/local/de.unihd.dbs.heideltime.standalone')m4_dnl
m4_define(m4_jvntextpro_mvn_localdir, `$HOME/.m2/repository/local/jvntextpro-2.0')m4_dnl

m4_dnl
m4_dnl SRL
m4_define(m4_srlgit, `https://github.com/newsreader/vua-srl-nl.git' )m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_srl_commitname, a5e63ba512cc326274b1285cf2af81ff8a2e04b5)m4_dnl
m4_define(m4_srl_commitname, 675d22d361289ede23df11dcdb17195f008c54bf)m4_dnl
m4_define(m4_srlsrc, m4_asnapshotroot/srlModuleForBN)m4_dnl
m4_dnl m4_define(m4_srldir, srlModuleForBN)m4_dnl
m4_define(m4_srldir, vua-srl-nl)m4_dnl
m4_define(m4_srlscript, srl)m4_dnl
m4_dnl
m4_dnl SRL post
m4_define(m4_postsrlgit, `https://github.com/newsreader/vua-srl-postprocess.git')m4_dnl 
m4_define(m4_postsrldir, `vua-srl-postprocess')m4_dnl  Subdir. of modules
m4_dnl m4_define(m4_postsrldir, `vua-srl-dutch-additional-roles')m4_dnl  Subdir. of modules
m4_define(m4_postsrlball, 20150706`'m4_postsrldir`'.tgz )m4_dnl  Subdir. of modules
m4_define(m4_postsrlscript, postsrl)m4_dnl
m4_dnl m4_define(m4_postsrlpy, vua-srl-dutch-additional-roles.py)m4_dnl
m4_define(m4_postsrlpy, main.py)m4_dnl
m4_dnl
m4_dnl Nom. coref
m4_define(m4_ncorefsrc, /dev/null )m4_dnl
m4_define(m4_ncorefdir, nomcoref)m4_dnl
m4_define(m4_ncorefscript, nomcoref)m4_dnl
m4_dnl
m4_dnl Ev. coref
m4_define(m4_evcorefdir, `vua-eventcoreference_v2')m4_dnl
m4_define(m4_evcoreftarball, 20150702-`'m4_evcorefdir`'.tgz)m4_dnl
m4_define(m4_evcorefscript, evcoref)m4_dnl
m4_define(m4_evcorefjar, EventCoreference-1.0-SNAPSHOT-jar-with-dependencies.jar)m4_dnl
m4_dnl
m4_dnl Ev. coref
m4_dnl
m4_dnl Opinion-miner
m4_define(m4_opinigit, https://github.com/cltl/opinion_miner_deluxe.git )m4_dnl  
m4_dnl m4_define(m4_opinidir, opinion_miner_de_luxe)m4_dnl  
m4_define(m4_opiniscript, opinimin)m4_dnl
m4_define(m4_opini_trained_models_ball, 20150730_opimin_final_models.tgz)m4_dnl
m4_define(m4_opini_commitname, b559d303da0c2da17f97d3fa41960d7fa3e1595b)m4_dnl
m4_define(m4_opini_nl_conf, opini_nl.cfg)m4_dnl
m4_dnl
m4_dnl Opinion-miner, temporary solution (20151013)
m4_define(m4_opini_temp_ball, 20151012VUA-opinion-miner.tgz)m4_dnl
m4_define(m4_opinidir, VUA-opinion-miner)m4_dnl
m4_define(m4_opini_dutchmodel_subdir, final_models/nl/news_cfg1)m4_dnl
m4_dnl
m4_dnl lu2synset
m4_define(m4_lu2synball, lu2synset.tgz)m4_dnl  
m4_dnl
m4_dnl Framenet Semantic Role Labeler
m4_define(m4_fsrlsrc, /dev/null )m4_dnl  Subdir. of modules
m4_define(m4_fsrldir, fsrl)m4_dnl  Subdir. of modules
m4_define(m4_fsrlscript, fsrl)m4_dnl
m4_dnl
m4_dnl dbpedia-ner
m4_dnl
m4_dnl m4_define(m4_dbpnergit, https://github.com/rubenIzquierdo/dbpedia_ner.git)m4_dnl
m4_define(m4_dbpnergit, https://github.com/PaulHuygen/dbpedia_ner.git)m4_dnl
m4_define(m4_dbpner_commitname, ab1dcbd860f0ff29bc979f646dc382122a101fc2)m4_dnl
m4_define(m4_dbpnerdir, dbpedia_ner)m4_dnl
m4_define(m4_dbpnerscript, dbpner)m4_dnl
m4_dnl
m4_dnl nomevents
m4_dnl
m4_dnl m4_define(m4_dbpnergit, https://github.com/rubenIzquierdo/dbpedia_ner.git)m4_dnl
m4_dnl m4_define(m4_nomeventball, vua-postprocess-nl.zip)m4_dnl
m4_define(m4_nomeventball, 20151217_vua-nominal-event-detection-nl.tgz)m4_dnl
m4_dnl  m4_define(m4_dbpner_commitname, ab1dcbd860f0ff29bc979f646dc382122a101fc2)m4_dnl
m4_dnl m4_define(m4_nomeventdir, vua-postprocess-nl)m4_dnl
m4_define(m4_nomeventdir, vua-nominal-event-detection-nl)m4_dnl
m4_define(m4_nomeventscript, nomevent)m4_dnl
m4_dnl
m4_dnl Utilities
m4_dnl
m4_dnl
m4_dnl Alpino
m4_dnl
m4_define(m4_alpino_version, 20706)m4_dnl
m4_define(m4_alpinosrc, Alpino-x86_64-linux-glibc2.5-`'m4_alpino_version`'-sicstus.tar.gz)
m4_define(m4_alpinourl, http://www.let.rug.nl/vannoord/alp/Alpino/binary/versions/Old/m4_alpinosrc)m4_dnl  
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
m4_dnl VUA-pylib
m4_define(m4_vuapylibgit, https://github.com/cltl/VUA_pylib.git)m4_dnl
m4_define(m4_vuapylibdir, python/VUA_pylib)m4_dnl
m4_dnl
m4_dnl SVMlight
m4_define(m4_SVMlightsite, http://svmlight.joachims.org/)m4_dnl
m4_define(m4_SVMlightball, svm_light.tar.gz)m4_dnl
m4_define(m4_SVMlightball_url, http://download.joachims.org/svm_light/current/`'m4_SVMlightball)m4_dnl
m4_define(m4_SVMlightdir, SVMlight)m4_dnl
m4_dnl
m4_dnl CRFsuite
m4_define(m4_CRFsuitesite, http://www.chokkan.org/software/crfsuite)m4_dnl
m4_define(m4_CRFsuiteball, crfsuite-0.12.tar.gz)m4_dnl
m4_define(m4_CRFsuiteball_url, https://github.com/downloads/chokkan/crfsuite/`'m4_CRFsuiteball)m4_dnl
m4_define(m4_CRFsuitedir, crfsuite-0.12)m4_dnl
m4_define(m4_CRFsuitebinball, crfsuite-0.12-x86_64.tar.gz)m4_dnl
m4_dnl
m4_dnl liblblbfgs
m4_define(m4_liblblbfgs_git, https://github.com/chokkan/liblbfgs.git)m4_dnl
m4_define(m4_liblblbfgs_ball, )m4_dnl
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
m4_define(m4_spotlightball, spotlightnl.tgz)m4_dnl
m4_define(m4_spotlight_host, `localhost')m4_dnl
m4_define(m4_spotlight_nl_port, 2060)m4_dnl
m4_define(m4_aspotlightdir, m4_aenvdir/spotlight)m4_dnl
m4_define(m4_spotlighturl, http://spotlight.sztaki.hu)m4_dnl
m4_define(m4_spotlight_download_url, m4_spotlighturl/downloads)m4_dnl
m4_define(m4_spotlightjarversion, 0.7)m4_dnl
m4_define(m4_simple_spotlightjar, dbpedia-spotlight-`'m4_spotlightjarversion`'.jar)m4_dnl
m4_define(m4_spotlightjar, dbpedia-spotlight-`'m4_spotlightjarversion`'-jar-with-dependencies-candidates.jar)m4_dnl
m4_define(m4_spotlight_nl_model_ball, nl.tar.gz)m4_dnl
m4_define(m4_spotlight_en_model_ball, en_2+2.tar.gz)m4_dnl
m4_define(m4_spotlight_en_port, 2020)m4_dnl
m4_define(m4_spotlight_snapdir, spotlight)m4_dnl
m4_define(m4_spotlight_dir, spotlight)m4_dnl
m4_dnl
m4_dnl Wikipedia db
m4_dnl
m4_define(m4_wikipediadb_tarball, wikipedia-db.v1.tar.gz)m4_dnl
m4_define(m4_wikipediadb_url, http://ixa2.si.ehu.es/ixa-pipes/models/m4_wikipediadb_tarball)m4_dnl
m4_define(m4_wikipediadb_tarball, wikipedia-db.v1.tar.gz)m4_dnl
m4_dnl
m4_dnl
m4_dnl
m4_dnl
m4_dnl Locations of programs and system-dependent definitions
m4_dnl
m4_define(m4_mkportbib, `/home/paul/bin/mkportbib')m4_dnl
m4_define(m4_printpdf, `lpr '$1`.pdf')m4_dnl
m4_define(m4_viewpdf, `evince '$1`.pdf')m4_dnl
m4_define(m4_latex, `pdflatex '$1)m4_dnl
m4_define(m4_nuwebbinary,   `m4_envbindir/nuweb')m4_dnl
m4_define(m4_anuwebbinary, `m4_aenvbindir/nuweb')m4_dnl
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
