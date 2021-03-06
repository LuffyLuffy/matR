
writeLines (colnames (xx1), "my_ids.txt")		# prep ID file; user would have their own

zz <- biomRequest (file="my_ids.txt", group_level="level2", evalue=1)

zz0 <- transform (zz, t_Log)

columns (zz0, "host_common_name|samp_store_temp|material")

princomp (zz0, map=c(col="host_common_name", pch="samp_store_temp"), labels="$$pubmed_id", cex=2)

distx (zz0, groups="$$host_common_name")

pp <- (rowstats (zz0, groups="$$material") $ p.value < 0.05)

pp[is.na(pp)] <- FALSE

pp

image (zz0 [pp,], margins=c(5,10), cexRow=0.3)

image (zz0, margins=c(5,10), cexRow=0.3)
