-- LenderName progress.

update zillow_all set lendername = regexp_replace(lendername, 'MTG', 'MORTGAGE') where regexp_matches(lendername, '\sMTG($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'MOTGAGE', 'MORTGAGE');
update zillow_all set lendername = regexp_replace(lendername, 'ST BK', 'STATE BANK') where regexp_matches(lendername, '\sST BK($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'ST', 'STREET') where regexp_matches(lendername, '\sST($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'BK', 'BANK') where regexp_matches(lendername, '\sBK($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'COMM', 'COMMUNITY') where regexp_matches(lendername, '\sCOMM($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'SAMANTHAAA', 'SAMANTHA');
update zillow_all set lendername = regexp_replace(lendername, 'FNCL CU', 'FINANCIAL CREDIT UNION');
update zillow_all set lendername = regexp_replace(lendername, 'RLTY', 'REALTY');
update zillow_all set lendername = regexp_replace(lendername, 'CIR', 'CIRCLE') where regexp_matches(lendername, '\sCIR($|\s)');
update zillow_all set lendername = regexp_replace(lendername, '\s(CORP|CO)($|\s)', ' CORPORATION ') where regexp_matches(lendername, '\s(CORP|CO)($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'CMNTY', 'COMMUNITY') where regexp_matches(lendername, '\sCMNTY($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'AVE', 'AVENUE') where regexp_matches(lendername, '\sAVE($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'SVGS', 'SAVINGS') where regexp_matches(lendername, '\sSVGS($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'HL(DG|G)', 'HOLDING') where regexp_matches(lendername, '\sHL(DGS|GS|DG|G)($|\s)');
update zillow_all set lendername = regexp_replace(lendername, '(MUNIC|MUNI|MUN)', 'MUNICIPAL') where regexp_matches(lendername, '\s(MUN|MUNI|MUNIC)($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'FCU', 'FEDERAL CREDIT UNION') where regexp_matches(lendername, '\sFCU($|\s)');
update zillow_all set lendername = regexp_replace(lendername, '(FINCL SVCES|FNCL SVCES)', 'FINANCIAL SERVICES') where regexp_matches(lendername, '\s(FINCL SVCES|FNCL SVCES)($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'NA(TL|T)', 'NATIONAL') where regexp_matches(lendername, '\sNA(TL|T)($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'FED', 'FEDERAL') where regexp_matches(lendername, '\sFED($|\s)');
update zillow_all set lendername = regexp_replace(lendername, 'CU', 'CREDIT UNION') where regexp_matches(lendername, '\sCU($|\s)');
