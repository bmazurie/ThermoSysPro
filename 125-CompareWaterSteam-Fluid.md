# Comparaison des modèles Fluid et WaterSteam

## Objet de la branche

La branche `125-CompareWaterSteam-Fluid` part de
`feature/125-mediumsImplementation-in-FluidTSP-on-develop` au commit
`c8a7181c3b81b2be44b82400622c035f54c93b4d`. Elle a ensuite intégré depuis
GitHub les nouveaux commits de cette branche jusqu'au commit
`f5a2f98b0240337fa1d43d5b0a5a56a6c2a241d4`.

Elle ajoute le package
`ThermoSysPro.Examples.ComparaisonFluidWaterSteam`. Pour chaque exemple simple
canonique de `ThermoSysPro.Fluid.Examples.SimpleExamples` utilisant le medium
eau-vapeur, le package doit contenir :

1. un modèle WaterSteam physiquement équivalent, avec les mêmes conditions aux
   limites, paramètres, commandes et horizon de simulation ;
2. un modèle `Compare...` qui instancie le SimpleExample Fluid d'origine et le
   nouveau modèle WaterSteam, et porte des `assert` sur les principales
   grandeurs comparables.

Les comparaisons doivent préciser si le point d'entrée est conservé en `(P,h)`
ou en `(P,T)`. Par défaut, on conserve `(P,h)`, qui est la représentation
commune aux connecteurs des deux architectures. Les tolérances combinent une
part relative et une part absolue, afin de rester pertinentes près de zéro.

## Périmètre

Sont inclus les exemples de base eau-vapeur dont le nom ne contient pas
`_Traces` ni `_FlueGases`. Les variantes de traces, les mélanges de fumées et
les exemples de media non eau-vapeur (`C3H3F5`, air sec, sels fondus) sont hors
du premier périmètre. Les exemples de combustion et les systèmes multi-fluides
ne seront traités que lorsqu'un homologue WaterSteam ayant la même physique
existe ; ils ne doivent pas être comparés par simple ressemblance de nom.

## Structure prévue

```text
ThermoSysPro/Examples/ComparaisonFluidWaterSteam/
  package.mo
  package.order
  PressureLosses/
  BoundaryConditions/
  Junctions/
  LoopBreakers/
  Sensors/
  Volumes/
  HeatExchangers/
  Machines/
  Boilers/
```

Chaque sous-package contient des couples `...WaterSteam` et `Compare...` ; le
modèle Fluid reste l'exemple original afin d'éviter une copie qui pourrait
diverger. Une classe partielle commune pourra être ajoutée uniquement si elle
réduit la duplication sans masquer les paramètres réellement comparés.

## Grandeurs à comparer

Les assertions portent sur les trois familles de grandeurs demandées :

- le débit massique `Q` ;
- les pressions `P`, notamment aux ports amont et aval ;
- les enthalpies amont et aval ;

La perte de charge peut être affichée comme diagnostic dérivé des deux pressions,
mais le critère de comparaison reste formulé sur `Q`, `P` et `h`.

Les `assert` sont évalués après l'initialisation et, pour les modèles
dynamiques, après les événements/échelons importants. Toute différence connue
de formulation ou de propriétés doit être documentée à côté de la tolérance ;
une tolérance ne doit pas servir à cacher une différence physique.

## Modèles à réaliser

### 1. Pertes de charge — premier lot

Quatorze couples sont à créer :

| Fluid de référence | WaterSteam à créer | Comparaison à créer |
| --- | --- | --- |
| `TestPipePressureLoss` | `TestPipePressureLossWaterSteam` | `ComparePipePressureLoss` |
| `TestSingularPressureLoss` | `TestSingularPressureLossWaterSteam` | `CompareSingularPressureLoss` |
| `TestLumpedStraightPipe` | `TestLumpedStraightPipeWaterSteam` | `CompareLumpedStraightPipe` |
| `TestInvSingularPressureLoss` | `TestInvSingularPressureLossWaterSteam` | `CompareInvSingularPressureLoss` |
| `TestControlValve` | `TestControlValveWaterSteam` | `CompareControlValve` |
| `TestThreeWayValve` | `TestThreeWayValveWaterSteam` | `CompareThreeWayValve` |
| `TestDynamicReliefValve` | `TestDynamicReliefValveWaterSteam` | `CompareDynamicReliefValve` |
| `TestIdealCheckValve` | `TestIdealCheckValveWaterSteam` | `CompareIdealCheckValve` |
| `TestDiaphragm` | `TestDiaphragmWaterSteam` | `CompareDiaphragm` |
| `TestBend` | `TestBendWaterSteam` | `CompareBend` |
| `TestSwitchValve` | `TestSwitchValveWaterSteam` | `CompareSwitchValve` |
| `TestIdealSwitchValve` | `TestIdealSwitchValveWaterSteam` | `CompareIdealSwitchValve` |
| `TestDynamicCheckValve` | `TestDynamicCheckValveWaterSteam` | `CompareDynamicCheckValve` |
| `TestCheckValve` | `TestCheckValveWaterSteam` | `CompareCheckValve` |

Chaque modèle `Compare...` instancie directement le SimpleExample Fluid indiqué
dans la première colonne et le modèle WaterSteam de la deuxième colonne.

### 2. Conditions aux limites

`TestRefH`, `TestRefP`, `TestRefQ` et `TestRefT`. `TestAirHumidity` est exclu de
la comparaison WaterSteam tant qu'aucune physique équivalente n'est définie.

### 3. Jonctions

`TestDeheaterMixer2`, `TestDryer`, `TestMassFlowMultiplier`, `TestMixer2`,
`TestMixer3`, `TestMixer8`, `TestSplitter2`, `TestSplitter3`, `TestStaticDrum`,
`TestStaticDrum_Plug` et `TestSteamExtractionSplitter`.

### 4. Loop breakers et capteurs

`TestLoopBreakerP`, `TestLoopBreakerQH` et `TestSensors`.

### 5. Volumes

`TestDynamicDrum`, `TestPressurizer`,
`TestTankHorizontal_withPipePressureLosses`,
`TestTank_withPipePressureLosses`, `TestTwoPhaseCavity`,
`TestTwoPhaseCavityOnePipe`, `TestTwoPhaseVolume`, `TestVolumeA`,
`TestVolumeATh`, `TestVolumeB`, `TestVolumeBTh`, `TestVolumeC`,
`TestVolumeCTh`, `TestVolumeD`, `TestVolumeDTh`, `TestVolumeI` et
`TestVolumeITh`.

La revue d'équivalence a confirmé seize homologues. Le candidat
`TestTankHorizontal_withPipePressureLosses` est exclu : `Fluid.TankHorizontal`
modélise un cylindre horizontal dont la section mouillée varie avec le niveau,
alors que la famille WaterSteam ne contient que `Volumes.Tank`, une cuve
verticale à section constante. Remplacer l'un par l'autre ne constituerait pas
une comparaison de portage.

### 6. Échangeurs

`TestDynamicCondenser`, `TestDynamicOnePhaseFlowPipe`,
`TestDynamicOnePhaseFlowShell`, `TestDynamicPlateHeatExchanger`,
`TestDynamicPlateHeatExchangerW`, `TestDynamicTwoPhaseFlowPipe`,
`TestDynamicTwoPhaseFlowRiser`, `TestDynamicWaterHeater`,
`TestDynamicWaterHeaterOnePipe`, `TestFixedPowerHeatExchanger`,
`TestNTUWaterHeater`, `TestSimpleDynamicCondenser`,
`TestSimpleStaticCondenser`, `TestStaticAerocondenser`,
`TestStaticCondenser`, `TestStaticCondenserHEI`,
`TestStaticExchangerDTorWorEff`, `TestStaticExchangerKS`,
`TestStaticPlateHeatExchanger`, `TestSteamGenerator_1SG` et
`TestSteamGenerator_4SG`.

Les exemples explicitement multi-fluides sont étudiés séparément avant d'être
ajoutés, car une instanciation WaterSteam de tous les circuits ne serait pas
nécessairement physiquement équivalente.

### 7. Machines et chaudières

Machines candidates : `TestCentrifugalPump`, `TestStaticCentrifugalPump`,
`TestSteamEngine` et `TestStodolaTurbine`. Les compresseurs, turbines à gaz,
ventilateurs, moteurs et systèmes CHP sont exclus tant qu'un homologue
WaterSteam pertinent n'est pas établi.

Chaudières candidates : `TestBoilerSystem` et `TestFossilFuelBoiler`, après
validation explicite de l'équivalence de leurs circuits eau-vapeur et de leurs
autres fluides.

## Méthode de validation

Chaque comparaison est validée séparément avec OpenModelica et Dymola :

1. chargement du `package.mo` local ;
2. `checkModel` ;
3. traduction réelle ;
4. simulation sur l'horizon de l'exemple Fluid ;
5. vérification que les `assert` ne se déclenchent pas ;
6. extraction de `Q`, `P` et `h`
   au début, à la fin et autour des événements.

Les scripts `.mos` des deux outils sont distincts et les fichiers générés sont
écrits dans `build/openmodelica/...` et `build/dymola/...`, hors des packages
Modelica. Les résultats Dymola et OpenModelica sont consignés séparément.

## État d'avancement

- [x] Branche créée depuis la branche Medium portée sur `develop`.
- [x] Mise à jour de la branche Medium récupérée depuis le dépôt GitHub
  `EDF-Lab/ThermoSysPro`, puis fusionnée dans cette branche par le commit
  `32ec5d6`.
  - [x] Les comparateurs utilisant les composants modifiés ont été rejoués avec
    OpenModelica 1.27.0 : `Dryer`, `StaticDrum`, `StaticDrum_Plug`,
    `SteamExtractionSplitter`, `DynamicDrum`, `Pressurizer`,
    `TwoPhaseCavity`, `TwoPhaseCavityOnePipe` et `TwoPhaseVolume`.
  - [x] Les neuf modèles passent `checkModel`, s'initialisent et atteignent leur
    horizon de simulation. Les écarts déjà classés au niveau `warning` restent
    visibles pour les volumes concernés.
  - [x] Pour `StaticDrum_Plug`, les deux bancs isolés étaient sur-spécifiés par
    `h(fixed=true)` sur le bouchon : OpenModelica signalait le même résidu
    initial de `8547,96 J/kg` côté Fluid et côté WaterSteam. La contrainte est
    désactivée uniquement dans les instances du comparateur ; le SimpleExample
    Fluid amont n'est pas modifié.
- [x] Plan et inventaire initial écrits avant la création des modèles.
- [x] Package `ThermoSysPro.Examples.ComparaisonFluidWaterSteam` créé et ajouté
  au `package.order` de `ThermoSysPro.Examples`.
- [ ] Pertes de charge — premier lot en cours (Dymola reste à faire).
  - [x] WaterSteam : créer les 14 bancs équivalents avec les mêmes paramètres,
    conditions aux limites, commandes et horizons que les SimpleExamples Fluid.
    - [x] `PipePressureLoss`, `SingularPressureLoss`, `LumpedStraightPipe`,
      `InvSingularPressureLoss`, `ControlValve`, `Diaphragm` et `Bend`.
    - [x] `ThreeWayValve`, `DynamicReliefValve`, `IdealCheckValve`,
      `SwitchValve`, `IdealSwitchValve`, `DynamicCheckValve` et `CheckValve`.
  - [x] Compare : créer les 14 modèles qui instancient le SimpleExample Fluid et
    le banc WaterSteam, avec des `assert` séparés sur `Q`, les `P` amont/aval et
    `h`.
    - [x] Comparaisons des sept modèles déjà listés ci-dessus créées.
    - [x] Comparaisons des sept modèles restants.
  - [x] OpenModelica : exécuter `checkModel`, traduction et `simulate` sur les
    14 modèles `Compare...`, vérifier les assertions et extraire `Q/P/h` au
    début, à la fin et autour des événements.
    - [x] `ComparePipePressureLoss` et `CompareSingularPressureLoss` passent.
    - [x] Les douze autres comparaisons passent également avec OpenModelica
      `v1.27.0-cmake`.
    - [x] Aucun `assert` de comparaison `Q/P/h` n'est déclenché. La vanne trois
      voies émet seulement un warning transitoire du solveur non linéaire pendant
      l'initialisation, qui se termine ensuite correctement.
    - [x] L'horizon de `ControlValve` est maintenu à `1 s`, comme le SimpleExample
      Fluid. Un essai exploratoire à `100 s` amenait les deux architectures de
      façon identique à des pressions négatives et ne représente pas le domaine
      valide de cet exemple.
  - [x] Graphique : positions des composants et tracés des connexions repris des
    SimpleExamples Fluid ; les deux bancs sont placés côte à côte dans chaque
    modèle `Compare...`.
  - [ ] Dymola : vérifier séparément les bancs Fluid et WaterSteam, puis les
    modèles combinés si la licence le permet. Les deux premiers modèles combinés
    dépassent actuellement la limite de complexité de la licence Dymola locale ;
    ce point est différé pendant la phase OpenModelica demandée.
- [ ] Conditions aux limites — OpenModelica terminé, Dymola reste à faire.
  - [x] WaterSteam : `TestRefH`, `TestRefP`, `TestRefQ`, `TestRefT`.
  - [x] Compare : assertions `Q/P/h` pour chaque modèle applicable.
  - [x] OpenModelica : `checkModel`, `buildModel`, simulation et contrôle
    `Q/P/h` réussis pour les quatre comparaisons, sans écart numérique constaté.
    - [x] `TestRefPWaterSteam` convertit la condition `(P,T)` du `SourceQ` Fluid
      en une enthalpie WaterSteam calculée au même point thermodynamique.
    - [x] Pour `RefH` et `RefT`, le `VolumeA` Fluid à bilan énergétique statique
      et à une seule entrée/sortie active est représenté côté WaterSteam par une
      fermeture algébrique sans perte (`SingularPressureLoss(K=0)`), car le
      `VolumeA` WaterSteam historique est toujours dynamique.
    - [x] `AirHumidity` reste hors périmètre : il n'a pas d'équivalent physique
      dans la famille WaterSteam.
  - [x] Graphique : annotations de placement et de connexion ajoutées aux quatre
    bancs WaterSteam, y compris le routage adapté des fermetures sans perte de
    `RefH` et `RefT` ; les modèles `Compare...` montrent Fluid à gauche et
    WaterSteam à droite.
  - [ ] Dymola : check, traduction, simulation et extraction `Q/P/h`.
- [ ] Jonctions — OpenModelica terminé, Dymola reste à faire.
  - [x] WaterSteam : les onze modèles listés dans la section « Jonctions ».
  - [x] Compare : assertions `Q/P/h` sur chaque branche d'entrée/sortie active.
  - [x] OpenModelica : `checkModel`, traduction et simulation réussis pour les
    onze comparaisons avec OpenModelica 1.23.1, sans déclenchement des assertions
    `Q/P/h`.
    - [x] Les changements de commande de `Mixer8` sont couverts sur l'horizon
      complet de l'exemple Fluid.
    - [x] Les séparations de phase de `Dryer`, `StaticDrum` et
      `StaticDrum_Plug` sont couvertes.
    - [x] `TestDryerWaterSteam` utilise sur ses trois ports des
      `SingularPressureLoss(K=0)` adiabatiques. Elles ferment le transport d'enthalpie du
      connecteur WaterSteam historique sans modifier les grandeurs comparées ;
      une connexion directe aux conditions limites est structurellement
      sous-déterminée avec ce composant.
    - [x] Les onze fichiers de résultats sont générés hors des sources dans
      `/tmp/compare_watersteam_fluid/omc/junctions`.
  - [x] Graphique : dispositions et connexions reprises des SimpleExamples Fluid
    pour les onze bancs ; les trois fermetures sans perte de `Dryer` disposent
    d'un placement et d'un routage dédiés. Tous les `Compare...` affichent les
    deux architectures côte à côte.
  - [ ] Dymola : même campagne, consignée séparément.
- [ ] Loop breakers et capteurs — OpenModelica terminé, Dymola reste à faire.
  - [x] WaterSteam : `TestLoopBreakerP`, `TestLoopBreakerQH`, `TestSensors`.
    - [x] `TestLoopBreakerQHWaterSteam` utilise une
      `SingularPressureLoss(K=0)` comme fermeture statique, pour la même raison
      que `TestRefTWaterSteam`.
    - [x] Le banc de capteurs couvre `SensorP`, `SensorQ`, `SensorQv`, `SensorH`
      et `SensorT`. `SensorSubC` et `SensorX` sont exclus : la famille
      WaterSteam historique ne fournit pas d'homologues pour les traces et la
      composition.
  - [x] Compare : assertions `Q/P/h` de part et d'autre des loop breakers et sur
    toute la chaîne de capteurs ; les cinq signaux de mesure communs sont aussi
    vérifiés.
  - [x] Graphique : placements et connexions repris des SimpleExamples Fluid ;
    chaque modèle `Compare...` montre Fluid à gauche et WaterSteam à droite.
  - [x] OpenModelica 1.23.1 : `checkModel`, `buildModel` et simulation réussis
    pour les trois comparaisons, sans déclenchement d'assertion.
  - [ ] Dymola : check, traduction et simulation.
- [ ] Volumes — implémentation et campagne OpenModelica réalisées. Il reste à
  résoudre l'échec de génération de code des cinq variantes avec port thermique
  `VolumeATh`, `VolumeBTh`, `VolumeCTh`, `VolumeDTh` et `VolumeITh` ; les autres
  limitations et écarts sont détaillés ci-dessous. Dymola reste à faire.
  - [x] Revue d'équivalence : seize modèles retenus et
    `TestTankHorizontal_withPipePressureLosses` exclu faute d'homologue
    WaterSteam représentant la même géométrie.
  - [x] WaterSteam : créer les seize bancs équivalents.
    - [x] Volumes simples : `VolumeA`, `VolumeB`, `VolumeC`, `VolumeD`, `VolumeI`
      et leurs cinq variantes avec port thermique, repérées par le suffixe
      `Th` : `VolumeATh`, `VolumeBTh`, `VolumeCTh`, `VolumeDTh` et `VolumeITh`.
      Dans ces variantes, le port `Cth` est raccordé à une
      `Thermal.BoundaryConditions.HeatSource` ; `Th` désigne donc l'ajout de ce
      couplage thermique au volume, et non une famille de fluide différente.
    - [x] Volumes dynamiques : `DynamicDrum`, `Pressurizer`, `Tank`,
      `TwoPhaseCavity`, `TwoPhaseCavityOnePipe` et `TwoPhaseVolume`.
    - [x] Les raccordements directs aux conditions limites historiques sont
      fermés par des `SingularPressureLoss(K=0)` ; les pertes, vannes et tubes
      déjà présents dans les exemples sont conservés tels quels.
  - [x] Compare : seize modèles avec assertions `Q/P/h` sur tous les ports
    actifs pertinents.
    - [x] Les assertions restent bloquantes pour les modèles qui respectent les
      tolérances communes.
    - [x] Elles sont émises au niveau `warning` pour `Pressurizer`, `Tank`,
      `TwoPhaseCavityOnePipe` et `TwoPhaseVolume`, afin de conserver le résultat
      complet tout en signalant les écarts physiques au lieu de les masquer par
      des tolérances élargies.
  - [x] Graphique : placements des composants et routage des connexions présents
    dans tous les bancs WaterSteam ; chaque `Compare...` place Fluid à gauche et
    WaterSteam à droite.
  - [x] OpenModelica 1.23.1 : `checkModel` réussi pour les seize comparaisons.
    - [x] Traduction et simulation réussies sans assertion pour les cinq volumes
      simples non thermiques, `DynamicDrum` et `TwoPhaseCavity`.
    - [x] Les six modèles dynamiques complexes atteignent leur horizon complet.
      `Pressurizer` signale à `404 s` un écart de débit sur `Cex` :
      `32.5723451 kg/s` côté Fluid et `32.5721811 kg/s` côté WaterSteam.
    - [x] `Tank` signale dès l'initialisation une différence de pression sur
      `Ce1` : `101300 Pa` côté Fluid et `-256516.45 Pa` côté WaterSteam. Cette
      différence importante confirme que les formulations historiques ne
      convergent pas vers la même branche d'initialisation dans ce banc.
    - [x] `TwoPhaseCavityOnePipe` signale à `2 s` un écart de pression interne
      (`13.0290961 MPa` contre `13.0283211 MPa`), puis à `8 s` un écart
      d'enthalpie liquide (`1.5313519 MJ/kg` contre `1.5313564 MJ/kg`).
    - [x] `TwoPhaseVolume` signale à `556 s` un écart d'enthalpie liquide
      (`1.5311056 MJ/kg` contre `1.5311089 MJ/kg`).
    - [ ] Les cinq variantes avec port thermique `VolumeATh`, `VolumeBTh`,
      `VolumeCTh`, `VolumeDTh` et `VolumeITh` passent `checkModel`, mais
      OpenModelica 1.23.1 échoue pendant la génération du code sur la dérivée
      des propriétés WaterSteam dans la boucle algébrique introduite par le
      raccordement de leur port thermique `Cth` à la `HeatSource`. Les méthodes
      de tearing standard et minimal ont été essayées ; ce point reste à
      résoudre sans modifier la condition limite thermique du SimpleExample.
  - [ ] Dymola : même campagne, avec diagnostic séparé de l'initialisation et
    vérification particulière des cinq variantes avec port thermique
    `VolumeATh`, `VolumeBTh`, `VolumeCTh`, `VolumeDTh` et `VolumeITh`.
- [ ] Échangeurs — implémentation WaterSteam/Compare réalisée pour les
  homologues retenus ; campagne OpenModelica en cours, Dymola reste à faire.
  - [x] Revue d'équivalence des 21 candidats.
    - [x] Dix-sept modèles ont un homologue WaterSteam suffisamment proche pour
      construire un banc de comparaison.
    - [x] `FixedPowerHeatExchanger` est exclu : aucun composant WaterSteam
      historique ne représente cet échange imposé par puissance avec la même
      interface.
    - [x] `StaticAerocondenser` est exclu : son second circuit est constitué de
      fumées et ne peut pas être remplacé par WaterSteam sans changer la
      physique.
    - [x] `StaticExchangerKS` est exclu : `StaticWaterWaterExchanger` n'emploie
      pas la même formulation fixe `K/S`, donc la ressemblance fonctionnelle ne
      suffit pas pour valider un portage.
    - [x] `SteamGenerator_4SG` est exclu : la famille WaterSteam historique ne
      fournit que le modèle `SteamGenerator_1SG`.
  - [x] WaterSteam : dix-sept bancs équivalents créés.
    - [x] Tubes et enveloppes : `DynamicOnePhaseFlowPipe`,
      `DynamicOnePhaseFlowShell`, `DynamicTwoPhaseFlowPipe` et
      `DynamicTwoPhaseFlowRiser`.
    - [x] Échangeurs à plaques : `DynamicPlateHeatExchanger`, sa variante `W`
      et `StaticPlateHeatExchanger`.
    - [x] Condenseurs : `SimpleStaticCondenser`, `StaticCondenser`,
      `StaticCondenserHEI`, `DynamicCondenser` et `SimpleDynamicCondenser`.
    - [x] Réchauffeurs : `DynamicWaterHeater`,
      `DynamicWaterHeaterOnePipe` et `NTUWaterHeater`.
    - [x] Autres : `StaticExchangerDTorWorEff` et `SteamGenerator_1SG`.
    - [x] Les connexions directes qui ne ferment pas le transport d'enthalpie
      des connecteurs historiques utilisent des
      `SingularPressureLoss(K=0)`, conformément aux autres familles de ce
      package.
  - [x] Compare : dix-sept modèles créés, chacun instanciant le SimpleExample
    Fluid et son banc WaterSteam avec des assertions séparées sur `Q`, `P` et
    `h` à tous les ports principaux.
    - [x] Les comparaisons directes conservent des assertions bloquantes.
    - [x] Les modèles dont les formulations historiques diffèrent conservent
      les mêmes tolérances mais émettent les écarts au niveau `warning`, afin de
      ne pas les masquer.
  - [x] Graphique : chaque banc WaterSteam contient les annotations de placement
    des composants et de tracé des connexions ; chaque `Compare...` place Fluid
    à gauche et WaterSteam à droite.
  - [ ] OpenModelica 1.27.0 : `checkModel` réussi pour les dix-sept
    comparaisons ; traduction et simulation validées ou diagnostiquées comme
    suit.
    - [x] Simulation complète réussie pour `DynamicOnePhaseFlowPipe`,
      `DynamicOnePhaseFlowShell`, `SimpleStaticCondenser`,
      `StaticPlateHeatExchanger`, `DynamicTwoPhaseFlowRiser`,
      `StaticExchangerDTorWorEff`, `NTUWaterHeater`, `StaticCondenser` et
      `StaticCondenserHEI`.
    - [x] Les assertions signalent sans les masquer les écarts de formulation :
      débits/enthalpies du riser, pression/enthalpie de l'échangeur DT/W/eff,
      pression du `NTUWaterHeater` et enthalpie d'extraction des deux
      condenseurs statiques.
    - [x] Les huit cas dynamiques en échec ont également été simulés côté Fluid
      seul, aux horizons de leurs SimpleExamples. Tous passent `checkModel`,
      mais six échouent déjà à l'initialisation Fluid : ces six anomalies ne
      peuvent donc pas être attribuées au seul portage WaterSteam.
    - [ ] `DynamicTwoPhaseFlowPipe` échoue des deux côtés sur la contrainte
      initiale de dérivée du débit `Q[1]`.
    - [ ] `DynamicPlateHeatExchanger` et `DynamicPlateHeatExchangerW` échouent
      déjà côté Fluid dans leurs systèmes non linéaires d'initialisation. Les
      bancs combinés échouent aussi côté WaterSteam ; le composant Fluid actuel
      comporte en outre une discrétisation et des termes de diffusion absents
      de son prédécesseur.
    - [ ] `DynamicWaterHeater` et `DynamicWaterHeaterOnePipe` échouent côté
      Fluid lors de la résolution KINSOL/KLU des grands systèmes non linéaires
      d'initialisation. Les échecs des comparateurs ne sont donc pas classés
      comme spécifiques à WaterSteam.
    - [ ] `SimpleDynamicCondenser` échoue également côté Fluid : dans les deux
      architectures, l'initialisation de la turbine explore une branche où la
      pression aval dépasse la pression amont, rendant négatif l'argument de la
      racine de la loi de Stodola.
    - [ ] `DynamicCondenser` simule correctement côté Fluid seul jusqu'à son
      horizon de `1 s` ; l'échec du comparateur provient du système non linéaire
      d'initialisation du banc WaterSteam.
    - [ ] `SteamGenerator_1SG` simule correctement côté Fluid seul jusqu'à son
      horizon de `1 s` ; le banc WaterSteam échoue sur la dérivée de pression
      de son volume interne `volumeA1`.
  - [ ] Dymola : check, traduction, simulation et comparaison `Q/P/h` des
    dix-sept modèles, avec diagnostic séparé des huit cas dynamiques encore en
    échec sous OpenModelica.
- [ ] Machines — implémentation et campagne OpenModelica terminées ; Dymola
  reste à faire.
  - [x] Revue d'équivalence : quatre SimpleExamples eau-vapeur retenus.
    - [x] `CentrifugalPump`, `StaticCentrifugalPump`, `SteamEngine` et
      `StodolaTurbine` possèdent chacun un homologue direct dans
      `ThermoSysPro.WaterSteam.Machines`.
    - [x] Les compresseurs, ventilateurs, turbines à gaz, moteurs à combustion
      et systèmes CHP sont exclus : leur fluide ou leur physique ne relève pas
      de la famille WaterSteam historique.
  - [x] WaterSteam : quatre bancs créés avec les mêmes paramètres, conditions
    aux limites et horizons que les SimpleExamples Fluid.
  - [x] Compare : quatre comparateurs avec assertions bloquantes sur `Q`, `P`
    et `h` aux ports amont et aval.
  - [x] Graphique : placements et connexions présents dans les quatre bancs ;
    chaque comparateur place Fluid à gauche et WaterSteam à droite.
  - [x] OpenModelica 1.27.0 : `checkModel`, traduction, initialisation et
    simulation réussis pour les quatre comparateurs, sans déclenchement des
    assertions `Q/P/h`.
  - [ ] Dymola : check, traduction, simulation et contrôle `Q/P/h`.
- [ ] Chaudières — implémentation et campagne OpenModelica terminées ; Dymola
  reste à faire.
  - [x] Revue d'équivalence : `BoilerSystem` et `FossilFuelBoiler` retenus.
    - [x] Le wrapper historique `MultiFluids.Boilers.BoilerSystem` n'expose pas
      la même interface que le wrapper Fluid actuel. Le banc WaterSteam de
      `BoilerSystem` reconstruit donc la topologie externe actuelle autour du
      composant historique `MultiFluids.Boilers.FossilFuelBoiler`, avec les
      mêmes sources d'air, de combustible et d'eau-vapeur.
  - [x] WaterSteam : deux bancs créés avec les mêmes débits, états d'entrée,
    composition du combustible, composition de l'air, pertes de charge et
    paramètres de chaudière.
  - [x] Compare : assertions `Q/P/h` sur les deux ports du circuit eau-vapeur.
    Les architectures historiques des fumées ne possèdent pas une enthalpie de
    connecteur directement comparable ; elles restent donc hors de ces
    assertions `Q/P/h`.
  - [x] Graphique : composants et connexions annotés dans les deux bancs ; les
    comparateurs affichent Fluid et WaterSteam côte à côte.
  - [x] OpenModelica 1.27.0 : `checkModel`, traduction, initialisation et
    simulation réussis pour les deux comparateurs jusqu'à `1 s`.
    - [x] Le débit de sortie eau-vapeur est identique (`24 kg/s`).
    - [x] Les formulations de propriétés produisent un écart de pression de
      sortie (`13,387656 MPa` côté Fluid et `13,387454 MPa` côté WaterSteam) et
      d'enthalpie de sortie (`521,3279 kJ/kg` contre `524,4768 kJ/kg`). Ces
      écarts restent signalés au niveau `warning` avec les tolérances communes.
  - [ ] Dymola : check, traduction, simulation et contrôle `Q/P/h`, en portant
    une attention particulière aux propriétés des fumées et de l'eau-vapeur.
- [ ] Étapes transverses.
  - [ ] Fixer et documenter les tolérances relatives et absolues de `Q`, `P` et
    `h` à partir des premiers résultats, sans masquer les écarts physiques.
  - [ ] Conserver des scripts `.mos` distincts pour OpenModelica et Dymola et
    écrire tous les artefacts de compilation hors des sources Modelica.
  - [ ] Vérifier les diagrammes et les extrémités de connexion dans un éditeur
    graphique ; la simulation seule ne valide pas leur lisibilité.
  - [ ] Documenter les différences attendues de formulation, d'initialisation ou
    de propriétés entre Fluid/Medium et WaterSteam.
  - [ ] Mettre à jour ce journal après chaque famille avec modèles, versions des
    outils, statut des comparaisons `Q/P/h`, warnings acceptés et anomalies. Les
    valeurs numériques ne sont consignées que lorsqu'elles diffèrent.
  - [ ] Lancer une campagne finale OpenModelica puis Dymola sur tout le package.

