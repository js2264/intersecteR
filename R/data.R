#airport_set <- {
    # data(USairports, package = 'igraphdata')
    # tb <- as_tbl_graph(USairports)
    # airports <- tb %>% activate('nodes') %>% tidygraph::as_tibble() %>% mutate(airport = 1:n()) %>% select(airport, name)
    # flights <- tb %>% activate('edges') %>% tidygraph::as_tibble() %>% 
    #     left_join(airports, by = c(from = 'airport')) %>% dplyr::rename(airport_1 = name) %>% 
    #     left_join(airports, by = c(to = 'airport')) %>% dplyr::rename(airport_2 = name) %>% 
    #     select(airport_1, airport_2)
    # uni <- unique(unlist(flights))
    
    # x <- lapply(uni, function(airport) {
    #     flights %>% 
    #         dplyr::filter({airport_1 == airport | airport_2 == airport}) %>% 
    #         unlist() %>% 
    #         unname() %>%
    #         unique() %>%
    #         '['(. != airport)
    # })
    # names(x) <- uni
    # return(x)
# }

# marker_set <- {
#     scran::findMarkers(WTs, groups = WTs$annotation, pval.type = 'any') %>% lapply(., function(markers) {
#         as.data.frame(markers) %>% 
#         arrange(desc(summary.logFC)) %>%
#         rownames_to_column('marker') %>% 
#         select(-starts_with('logFC')) %>% 
#         filter(summary.logFC >= log2(2) & p.value <= 0.01) %$%
#         marker
# }) 
# }

#marker_set <- list(
#    CyclingProgenitors = c("Mki67", "Pclaf", "Cdca3", "Tk1",
#    "Ccna2", "Cenpm", "Birc5", "Pbk", "Esco2", "Spc24", "Cdca8",
#    "Aurkb", "Rrm2", "Top2a", "Cenpf", "Clspn", "Gmnn", "Tpx2", "Spc25",
#    "Dut", "Hmmr", "Tyms", "H2afz", "Prc1", "Nusap1", "Mis18bp1",
#    "Lmnb1", "Hmgb2", "Cenpk", "Rpa2", "Hells", "Smc2", "Cdk1", "Atad2",
#    "Kif23", "Ube2c", "Racgap1", "Sgo2a", "Stmn1", "Knstrn", "Ccnb2",
#    "Tacc3", "Cks2", "Aspm", "Tubb5", "Ckap2", "Rrm1", "Dhfr", "Cenpq",
#    "H2afx", "Hist1h1b", "Knl1", "Rpsa", "Lockd", "Mcm6", "Cenpa",
#    "Ect2", "Mcm3", "Cenpw", "Incenp", "Dctpp1", "Mcm4", "Pcna",
#    "Dnajc9", "Rfc4", "Cenpe", "Selenoh", "Fabp7", "Kif11", "Dnmt1",
#    "Lsm2", "Ckap2l", "Ran", "Ezh2", "Lig1", "Mcm7", "Usp1", "Smc4",
#    "Rplp1", "Gins2", "Siva1", "Nasp", "Tmsb4x", "Ube2s", "Cks1b",
#    "Anp32b", "Pea15a", "Ccnb1", "Cdc20", "Vim", "Dek", "Dtymk",
#    "Hmgn2", "Tipin", "Hjurp", "Snrpd1", "Rpl39", "Ranbp1", "Igfbp5",
#    "Igfbp2", "Nucks1", "Ybx1", "Mest", "Hnrnpab", "Rps12", "Alyref",
#    "Hat1", "Tubb2a", "Orc6", "Nme2", "Paics", "Rbm3", "Nuf2", "H1fx",
#    "Srsf2", "Eef1b2", "Hpf1", "Hnrnpd", "Tmpo", "Srsf3", "Lgals1",
#    "Nt5dc2", "Jpt1", "Ddah1", "Rad21", "Ckb", "Slbp", "Calm2", "Tuba1b",
#    "Cmc2", "Lsm6", "Banf1", "Cdkn2c", "Rnaseh2c", "Srsf7", "Tpm4",
#    "Ccdc34", "Nap1l1", "Rps19", "Nes", "Hnrnpa1", "Phgdh", "Tubb2b",
#    "Cdk4", "Ptn", "Rhoc", "S100a11", "Eif4a1", "Tceal9", "Nme1",
#    "Fxyd6", "Id1", "Fkbp2", "Cryab", "Gpx8", "Pkm", "Anp32e", "Nsmce4a",
#    "Actb", "Tmsb10", "Anxa3", "Olig1", "Set", "Hacd4", "Mettl9",
#    "Ptprz1", "Slc4a4", "Tagln", "Rln1", "Acta2", "Bex3", "Ptms",
#    "Pole4", "Basp1", "Ccnd2", "Fabp5", "Myl9", "Scpep1", "Ppp1r14b",
#    "Meg3", "C1ql3", "Id3", "Timp3", "Emc8", "Ccn5", "Mpp6"), 
#    Progenitors = c("Igfbp5",
#    "Vim", "Fabp7", "Pea15a", "Id3", "Ddah1", "Prdx6", "Ckb", "Cd81",
#    "Eef1a1", "Rps4x", "Rpl18a", "Meg3", "Rps19", "Cryab", "Cst3",
#    "Rps12", "Id1", "Ldhb", "Tubb2a", "Tmsb4x", "Oat", "Kcnk2", "Gpm6b",
#    "Igfbp2", "Sparc", "Scpep1", "Timp3", "Slc4a4", "Tubb5", "Clu",
#    "Rpsa", "Mt1", "Eef1b2", "Gpx8", "Slc1a3", "Fxyd6", "Ccn2", "Ahnak",
#    "Tubb2b", "Slco1a4", "Rcn2", "Ndrg2", "Plpp3", "Mtss1", "Tprgl",
#    "Gas1", "Tcp11l2", "Phgdh", "Thra", "Aldoa_ENSMUSG00000030695",
#    "Gfap", "Tagln", "Lgals1", "Tmem176b", "Cadm4", "Pkm", "Zfp428",
#    "Ogn", "Gas5", "Sox4", "Ttyh1", "Scg5", "Schip1", "Mgst1", "Gabrb1",
#    "Fbxo2", "Malat1", "Tsc22d4", "Gstm1", "Ifitm2", "Kcnj10", "Aldoc",
#    "Glul", "Aqp4", "Ednrb", "Pla2g7", "Tceal9", "Myl9", "Gadd45g",
#    "Mpp6", "Acta2", "Ucma", "Ccn1"), 
#    Deuterosomal = c("Cdk1", "Hsp90aa1",
#    "Cks2", "Deup1", "Plvap", "Nudc", "Top2a", "Ckap2l", "Hyls1",
#    "Meig1", "H2afx", "Shisa8", "Plk4", "Prc1", "Cdc20", "Dynlrb2",
#    "H2afz", "Rsph1", "Ccdc18", "Elof1", "Ccno", "Lrrc23", "Ube2t",
#    "Tpx2", "Ccdc61", "Ruvbl2", "Cdca8", "Ndufaf3", "Aard", "Tmem107",
#    "Ube2s", "Tmem97", "Fam216a", "Mdm1", "Cenpf", "1700012B09Rik",
#    "4833427G06Rik", "Myb", "6820408C15Rik", "Hmgb2", "Slc17a8",
#    "Ptges3", "Cfap45", "Smc4", "Zmynd10", "Cby1", "Ccdc192", "Ddx39",
#    "Ccnb1", "Gm11837", "Txn1", "Npm3", "Morn5", "Pbx4", "Cav2",
#    "Ctsh", "Acyp1", "Swi5", "Ccdc39", "Ccdc113", "Cfap206", "Cks1b",
#    "Cfap36", "Gpn2", "Calm2", "Smc2", "Cenpv", "Tekt1", "Tuba1b",
#    "Foxj1", "1700094D03Rik", "Drc3", "Ak6", "Fbxo36", "Cep126",
#    "1700016K19Rik", "Strbp", "Stox1", "Ccdc34", "Ccna1", "Cfap161",
#    "Cfap298", "Lsm2", "Tctex1d2", "Lrwd1", "Lrrc51", "Srsf7", "Ift20",
#    "Nme5", "Cep350", "Tubb4b", "Wdr63", "Mt1", "Spint2", "Pifo",
#    "Ccdc153", "Cfap299", "Hspa2", "Nop58", "Lrrc46", "Lsm6", "Phf10",
#    "Rif1", "Bphl", "Poc5", "Ppp1r35", "Nap1l1", "Odf3b", "Tppp3",
#    "Rnaseh2c", "Tekt4", "Banf1", "Zfp91", "Mns1", "Ak7", "Crip3",
#    "Spag6l", "Ccdc146", "Tango6", "Psip1", "Ift22", "Dynll1", "Cep128",
#    "Ankrd54", "Thoc7", "Iqcg", "Bbof1", "Csrp2", "Ubl4a", "Ranbp1",
#    "Ssna1", "Dpy30", "1110032A03Rik", "Cetn2", "1700001C02Rik",
#    "Hydin", "Cfap126", "Ahsa1", "Pmp22", "Riiad1", "Kcne1l", "Lsm4",
#    "Ddt", "Wdr78", "Srsf3", "Cct7", "Map9", "Dnajc15", "Rsph9",
#    "Nphp1", "Mt2", "Ppp1r32", "Ift74", "Psmc3ip", "Dnali1", "Nat9",
#    "Snrpd1", "Chchd10", "Mlf1", "Tcp1", "Hspa4l", "Hirip3", "Fam183b",
#    "Spata24", "Tpgs2", "Tspo", "1700007K13Rik", "Pcm1", "Ropn1l",
#    "Yif1b", "Bola1", "Hras", "Lrrc10b", "Gm5617", "Timm17b", "Spata33",
#    "Cep83", "Ccdc74a", "Ruvbl1", "Cdkn1a", "Gm973", "Spef1", "Arhgdig",
#    "Slf1", "Erlin2", "Lrriq1", "Cfap52", "Ccdc30", "Nek1", "Hacd1",
#    "Psmb6", "Cntrl", "Mrpl24", "Gm17018", "Dmkn", "Immp1l", "Sugt1",
#    "Ak9", "Pih1d2", "Spa17", "Spef2", "Hsph1", "Stip1", "Enkur",
#    "Hipk1", "Vit", "Gm1673", "Dap3", "Oscp1", "Akr7a5", "Pfdn2",
#    "Tcp11l2", "Wdr35", "Lgals3", "Znrd2", "Gm37800", "Igfbp2"),
#    MCCs = c("Meig1", "1700024G13Rik", "Ccdc153", "Tctex1d4",
#    "Tppp3", "Nme9", "Efcab10", "Tmem212", "Cfap299", "1700001C02Rik",
#    "Odf3b", "3300002A11Rik", "Ak7", "Dynlrb2", "Arhgdig", "Ascc1",
#    "Fam183b", "Ccdc113", "1700012B09Rik", "Rsph1", "Drc3", "Hdc",
#    "1700016K19Rik", "Cfap126", "Hydin", "Spint2", "Cfap161",
#    "Efcab1", "Gm16201", "Ccdc146", "4833427G06Rik", "Ppp1r32",
#    "1700007K13Rik", "Fam166b", "Zmynd12", "Elof1", "Cfap70",
#    "Cfap65", "Riiad1", "Pifo", "Poln", "Tekt4", "Spef1", "Nnat",
#    "Morn3", "Spa17", "Hsp90aa1", "1700028P14Rik", "Lrrc51",
#    "Cfap53", "Chchd10", "Dnah12", "Tmem107", "Calm1", "Gm16006",
#    "6820408C15Rik", "Cfap206", "Morn5", "Crip1", "Spag6l", "1810058I24Rik",
#    "Cfap52", "Tubb4b", "Dnaic2", "1700001L19Rik", "Dnali1",
#    "Ppil6", "Fbxo36", "Rsph4a", "Lrrc23", "Cfap77", "Med9os",
#    "Slc2a1", "Tekt1", "1700094D03Rik", "Lrrc6", "Cep126", "Gm867",
#    "Ccdc81", "Ccdc74a", "Ubc", "Gm19935", "Cfap44", "Lrrc34",
#    "Got1l1", "Ccdc189", "Txn1", "Ccpg1os", "Cetn4", "1110017D15Rik",
#    "Bbox1", "Nme5", "Mpp1", "Ctsh", "Rtn4", "Iqca", "1700019G24Rik",
#    "Zmynd10", "Spef2", "Dnah6", "Ropn1l", "Spaca9", "1110032A03Rik",
#    "Nudt14", "Bphl", "Fam216b", "Calml4", "Ccdc39", "Spata24",
#    "Dmkn", "Nudc", "Capsl", "Mlf1", "Iqcg", "Sox9", "Cfap45",
#    "2010001K21Rik", "Dnaic1", "Lrrc46", "Pih1d2", "Acot1", "Lrrc10b",
#    "Erich2", "Cfap54", "Ahnak", "Ccna1", "Cetn2", "Dnajc15",
#    "Syne1", "Dnaaf4", "Tubb2a", "Foxj1", "2410004P03Rik", "Hspa2",
#    "Maats1", "Catip", "Gm5617", "Enkur", "Ypel3", "9230114K14Rik",
#    "Wdr78", "Rdh10", "Rsph9", "Ccdc30", "Nek1", "Pgk1", "Prxl2a",
#    "Ak9", "Dnah11", "Lrrc74b", "Nmb", "Zfp36l1", "Lrriq1", "Ift74",
#    "Mns1", "Ccdc170", "Spag8", "Hopx", "Sostdc1", "Cfap43",
#    "St3gal6", "Pltp", "Dynll1", "Gpx8", "Dydc2", "Gm14964",
#    "Ccdc173", "Wdr66", "Rnase4", "Cpne2", "Dnah9", "Drc1", "Bola1",
#    "Mt1", "Gas6", "Gm973", "Cdkl4", "Sat1", "Ivns1abp", "Ablim1",
#    "Timp3", "Ift88", "Cd24a", "BC005624", "1700088E04Rik", "Tm4sf1",
#    "Tsga10", "Gm17018", "Armc3", "Eml2", "5031425E22Rik", "Fez1",
#    "Eea1", "Ttll3", "Dusp14", "Tsc22d4", "Erlin2", "Saxo2",
#    "Hipk1", "Ccn2", "Rnf227", "Gm38414", "Ift20", "Wdr35", "Lgals3",
#    "Slc25a18", "Hsph1", "1700029J07Rik", "Chchd6", "Capg", "4933407L21Rik",
#    "Strbp", "Txnip", "Ccdc96", "Cfap97d2", "Cep83", "Pdlim4",
#    "Oscp1", "Dync2h1", "Nudt4", "Ccdc34", "Itm2c", "Ctxn1",
#    "Tctex1d2", "Mgst1", "Pttg1", "Elmod1", "Dnajb13", "Aldoc",
#    "Tcp11l2", "Cep290", "Rarres2", "Mt2", "Pdcd6", "Aqp4", "Gsta4",
#    "Mia", "Pfkp"), 
#    Unannot = c("Meig1", "Dynlrb2", "Tppp3",
#    "Ascc1", "Cfap126", "Rsph1", "Ccdc113", "Pifo", "1700016K19Rik",
#    "Cfap299", "1700007K13Rik", "Odf3b", "Rsph4a", "Tubb4b",
#    "Drc3", "Riiad1", "1700094D03Rik", "Elof1", "Lrrc51", "Spag6l",
#    "Fam216b", "Ccdc146", "Bphl", "Ccdc74a", "Tekt1", "Hspa2",
#    "Gm19935", "Nme5", "Dnali1", "1110032A03Rik", "Chchd10",
#    "Spef2", "Tmem107", "Vim", "Pea15a", "Foxj1", "Calml4", "Fth1",
#    "2410004P03Rik", "Igfbp5", "Cfap54", "Mlf1", "Wdr78", "Ctsh",
#    "Ccdc39", "Dbi", "Pltp", "Capsl", "Prdx6", "Cd81", "Crip1",
#    "Cryab", "Timp3", "Gfap", "Ahnak", "Tubb2a", "1110017D15Rik",
#    "Nnat", "Tm4sf1", "Ubc", "Ypel3", "Sox9", "Sparc", "Cd9",
#    "Ccn2", "Ckb", "Aldoa_ENSMUSG00000030695", "Mt1", "Tsc22d4",
#    "Mgst1", "Kcnk2", "Tmsb4x", "Ndrg2", "Rtn4", "Gpx8", "Pdlim4",
#    "Thra", "Dync2li1", "Tcp11l2", "Pacrg", "Sat1", "Hopx", "Mt2",
#    "Aldoc", "Traf1", "Itm2c", "Gas6", "Acot1", "Pla2g7", "Aqp4",
#    "Tagln", "Ucma", "Prelp", "Acta2")
#)
#
#set.seed(42)
#toy_set <- map(sample(400:1000, size = 4), function(x) as.character(sample(1:1000, size = x))) %>% setNames(LETTERS[1:4])
