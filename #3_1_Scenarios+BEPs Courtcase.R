# We gaan functies definieren waarmee de verwachtingswaarde in beeld kan worden gebracht
# bij verschillende succeskansen. De factoren die te maken hebben met de solvabiliteit en
# juridische fouten stellen we voor het gemak op .90 (solvabiliteit) en .85 (juridische
# fouten).
# Het verschil tussen de diverse functies zit 'm in de opbrengst van de procedure waarmee
# gerekend wordt. Deze laat ik varieren van 200 (opbrengst_max) tot 25 (opbrengst_min).
# De tussenliggende waardes noem ik opbrengst_ave_plus (100) en opbrengest_ave_minus (50).
#
# Aldus krijgen we een beeld van het break-even punt bij verschillende opbrengsten. Het
# break-even punt (BEP) wordt uitgedrukt als (minimale) succeskans in de procedure die nodig
# is om quite te spelen — wanneer de procedure een groot aantal keer zou worden gevoerd...
#
# Omgekeerd kan ook een beeld worden gevormd van de verwachte opbrengst bij een bepaalde
# succeskans in de procedure. Naarmate de opbrengst hoger wordt, zal de verwachte opbrengst
# natuurlijk ook hoger worden.

# Definitie van variabelen — makkelijk als we de zaak nog eens in beeld willen brengen met
# andere uitgangswaarden:
kosten <- 20
opbrengst <- 200


# Definitie verschillende functies:
opbrengst_max <- function(x) {(x/100)*(85/100)*(90/100)*200 - (1-((x/100)*(85/100)*(90/100)))*kosten}
opbrengst_ave_plus <- function(x) {(x/100)*(85/100)*(90/100)*100 - (1-((x/100)*(85/100)*(90/100)))*kosten}
opbrengst_ave_minus <- function(x) {(x/100)*(85/100)*(90/100)*50 - (1-((x/100)*(85/100)*(90/100)))*kosten}
opbrengst_min <- function(x) {(x/100)*(85/100)*(90/100)*25 - (1-((x/100)*(85/100)*(90/100)))*kosten}

# Weergave van functies in een grafiek:
curve(opbrengst_max, 0, 100, n=1000, xname = "Winstkans (%)", ylab = "Euro (x 1000)", main = "Opbrengst Procedure / Winstkans")
curve(opbrengst_ave_plus, 0, 100, n=1000, add = TRUE)
curve(opbrengst_ave_minus, 0, 100, n=1000, add = TRUE)
curve(opbrengst_min, 0, 100, n=1000, add = TRUE)


# Hoe vinden we de snijpunten met de X-as voor de verschillende functies?
# Ha, goeie! Je zou verwachten dat dit makkelijk uit te vinden is middels de een of andere
# functie, maar dat valt reuze tegen. Het lijkt makkelijker om te schatten waar het snijpunt
# zich bevindt, en vervolgens de grafiek te maken met een range waardes die dichtbij het
# vermoedelijke snijpunt liggen.
# De locator() functie komt hierbij goed van pas. Door die functie toe te passen worden de
# x en y coordinaten van de cursor bij een muisklik vastgelegd. Middels de ESC-toets komen
# we weer in de reguliere console-omgeving terecht en worden de vastgelegde coordinaten
# getoond.
# Middels wat herhaaldelijk toepassen van locator() heb ik de volgende snijpunten kunnen
# benaderen:
abline(v=11.88, col = "gray")
abline(v=21.79, col = "gray")
abline(v=37.35, col = "gray")
abline(v=58.07, col = "gray")

# Toevoegen van 0-lijn voor een duidelijker beeld:
abline(h=0)

# Nogmaals de grafiek opbouwen, nu om opbrengsten bij 50% winstkans weer te geven::
curve(opbrengst_max, 0, 100, n=1000, xname = "Winstkans (%)", ylab = "Euro (x 1000)", main = "Opbrengst Procedure / Winstkans")
curve(opbrengst_ave_plus, 0, 100, n=1000, add = TRUE)
curve(opbrengst_ave_minus, 0, 100, n=1000, add = TRUE)
curve(opbrengst_min, 0, 100, n=1000, add = TRUE)

# Toevoegen van een verticale lijn bij 50% winstkans:
abline(v=50)

# Middels separate berekeningen gevonden snijpunten met 50-procentslijn gevonden opbrengsten
# weergeven als grijze lijnen:
abline(h=opbrengst_max(50), col = "gray")
abline(h=opbrengst_ave_plus(50), col = "gray")
abline(h=opbrengst_ave_minus(50), col = "gray")
abline(h=opbrengst_min(50), col = "gray")

# Opbrenst bij 50-procent winstkans volgens diverse scenario's:
opbrengst_max(50)
opbrengst_ave_plus(50)
opbrengst_ave_minus(50)
opbrengst_min(50)

# Max           (200.000)       61.000
# Ave Plus      (100.000)       25.000
# Ave Minus      (50.000)        7.000
# Min            (25.000)       -3.000


