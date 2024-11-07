<?php require('template/import/head.php'); ?>

<body class="hold-transition sidebar-mini layout-fixed">

    <div class="wrapper">

        <?php require('template/import/navbar.php'); ?>
        <?php require('template/import/aside.php'); ?>

        <div class="content-wrapper">
            
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"> DEGUSTATION </h1>
                    </div>

                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">BTL</a></li>
                        <li class="breadcrumb-item active">DEGUSTATION</li>
                        </ol>
                    </div>

                    </div>
                </div>
            </div>

            <section class="content sect_list">

                <div class="container-fluid">

                    <div class="card">

                        <div class="card-header">

                            <div class="row">
                                <div class="col-md-3 animation__transright">
                                    <div class="info-box bg-info">
                                        <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-text"> TOTAL </span>
                                            <span class="info-box-number"> <?= number_format( $Total,0) ?> </span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 00%"></div>
                                        </div>
                                        <span class="progress-description">
                                            BTL
                                        </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3 animation__transright">
                                    <div class="info-box bg-secondary">
                                        <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-text"> Nbre de Date </span>
                                            <span class="info-box-number"> <?= number_format( $Nbre,0) ?> </span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 00%"></div>
                                        </div>
                                        <span class="progress-description">
                                        BTL
                                        </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3 animation__transright">
                                    <div class="info-box bg-success">
                                        <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-text"> MOYENNE VENTE </span>
                                            <span class="info-box-number"> <?= number_format( $moyenne,0) ?> </span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 00%"></div>
                                        </div>
                                        <span class="progress-description">
                                        BTL
                                        </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3 animation__transright">
                                    <div class="info-box bg-dark">
                                        <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

                                        <div class="info-box-content">
                                        <span class="info-box-text"> LAST DEGUSTATION </span>
                                        <span class="info-box-number"> <?= $last_degustation->date_degustation ?>  </span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 00%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <?= number_format( $last_degustation->valeur_total,0) ?> 
                                        </span>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="card-body">

                            <div class="row <?= ShowIFPermit("BTL_DEGUSTATION_ADD") ?>">
                                <button type="button" class="btn btn-md btn-dark btn-flat font-weight-bold" onclick="back('.sect_list','.sect_add')">
                                <i class="fas fa-plus"></i> AJOUTER
                                </button>
                            </div>

                            <table class="table table-bordered tableordered">

                                    <thead>
                                        <tr>
                                            <th> Date </th>
                                            <th> MD Matricule </th>
                                            <th> MD Noms </th>
                                            <th> quantite </th>
                                            <th> valeur </th>
                                            <th> ... </th>
                                        </tr>
                                    </thead>

                                    <tbody class='fts'>
                                        <?php
                                            foreach ($degustations as $degustation) {
                                        ?>
                                            <tr>
                                                <td> <?= $degustation->date_degustation ?> </td>
                                                <td> <?= $degustation->market_develloper ?> </td>
                                                <td> <?= $degustation->MD_name ?> </td>
                                                <td> <?= number_format( $degustation->quantite,0) ?> </td>
                                                <td> <?= number_format( $degustation->valeur_total,0) ?> </td>
                                                <td> 
                                                    <button class="btn btn-sm btn-default" onclick="showDegustation('<?= $degustation->degustation_id ?>')">
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        <?php
                                            }
                                        ?>
                                    </tbody>

                            </table>

                        </div>

                    </div>

                </div>

            </section>

            <section class="content sect_add invisible">

                <div class="container-fluid">

                <div class="card">

                    <div class="card-header">
                    <button type="button" class="btn btn-sm btn-dark btn-flat font-weight-bold" onclick="back('.sect_add','.sect_list')">
                        <i class="fas fa-arrow-left"></i> RETOUR
                    </button>
                    </div>

                    <div class="card-body">
                    
                    <div class="row">
                        
                        <div class="col-md-10  mx-auto">

                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">VENTE MD</h3>
                            </div>

                            <form action='./?action=degustation&subaction=saveDegustation' method='POST'>
                            <div class="card-body">

                                <div class="row">
                                <div class="form-group col-6">
                                    <label for="codeprojet"> Date de Degustation </label>
                                    <input type="date" class="form-control" name="date_degustation" required>
                                </div>

                                <div class="form-group col-6">
                                    <label for=""> MARKET DEVELLOPER </label>
                                    <select class="form-control select2" style="width: 100%;" name="market_develloper" required>
                                    <?php
                                        foreach ($food_truckers as $ft) {
                                    ?>
                                        <option value='<?= $ft->employee?>'> <?= $ft->noms?> </option>
                                    <?php
                                        }
                                    ?>
                                    </select>
                                </div>
                                </div>

                                <div class="row border m-1 p-1">

                                    <div class="col-12 text-center p-1">
                                        <span class="font-weight-bold display-5"> ARTICLES </span>
                                    </div>

                                    <div class="form-group col-3">
                                    <label for="interet"> Article </label>
                                    <select class="form-control" id="article">
                                        <!-- <option disabled selected> Article </option> -->
                                        <?php
                                        foreach ($articles as $article) {
                                        ?>
                                            <option value='<?= $article->code?>'> <?= $article->designation?> </option>
                                        <?php
                                        }
                                        ?>
                                    </select>
                                    </div>

                                    <div class="form-group col-3">
                                    <label for="quantite"> Quantite </label>
                                    <input type="number" min="1" class="form-control" id="quantite">
                                    </div>

                                    <div class="form-group col-3">
                                        <label for="unite"> Unité </label>
                                        <select class="form-control" id="unite">
                                    
                                            <!-- <option disabled selected> Unité </option> -->
                                            <?php
                                            foreach ($unites_stocks as $unite) {
                                            ?>
                                                <option value='<?= $unite->code_unite?>'> <?= $unite->designation?> </option>
                                            <?php
                                            }
                                            ?>

                                        </select>
                                    </div>

                                    <div class="form-group col-3">
                                        <label for="valeur"> Valeur </label>
                                        <input type="number" min="1" step="1" class="form-control" id="valeur">
                                    </div>

                                    <div class="form-group col-4 mx-auto">
                                        <span class="btn btn-dark btn-block font-weight-bold" onclick="addLigneDegustation()"> AJOUTER <i class="fas fa-arrow-down"></i> </span>
                                    </div>

                                    <div class="form-group col-12">
                                        <input type="text" class="form-control ligne_degustation" disabled>
                                        <input type="hidden" class="form-control ligne_degustation" name="ligne_degustation">
                                    </div>

                                    <table class="table table-bordered table-striped">

                                        <thead>
                                            <tr>
                                                <th> Article </th>
                                                <th> Quantite </th>
                                                <th> Unité </th>
                                                <th> Valeur </th>
                                            </tr>
                                        </thead>

                                        <tbody class='fts lignedegustation'>

                                        </tbody>
                                    </table>

                                </div>

                            </div>

                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-dark font-weight-bold"> 
                                <i class="fas fa-save"></i> ENREGISTRER
                                </button>
                            </div>
                            </form>

                        </div>

                        </div>

                    </div>

                    </div>

                </div>

                </div>
                
            </section>

            <section class="content sect_mod invisible">

                <div class="container-fluid">

                    <div class="card">

                        <div class="card-header">
                            <button type="button" class="btn btn-sm btn-dark font-weight-bold" onclick="back('.sect_mod','.sect_list')">
                                <i class="fas fa-arrow-left"></i> RETOUR
                            </button>
                        </div>

                        <div class="card-body">
                        
                            <div class="row">
                                
                                <div class="col-md-8  mx-auto">

                                    <div class="card card-secondary">
                                        <div class="card-header">
                                            <h3 class="card-title">DEGUSTATION</h3>
                                            <div class="card-tools <?= ShowIFPermit("BTL_DEGUSTATION_SUP") ?>">
                                                <form action='./?action=degustation&subaction=deleteDegustation' method='POST'>
                                                    <input type="hidden" class="form-control degustation_id" name="degustation_id">
                                                    <button class="btn btn-dark btn-sm font-weight-bold"> <i class="fas fa-minus"></i> SUPPRIMER </button>
                                                </form>
                                            </div>
                                        </div>

                                        
                                        <div class="card-body">

                                        <div class="row">
                                            <div class="form-group col-6">
                                                <label for="codeprojet"> Date de Degustation </label>
                                                <input type="date" class="form-control date_degustation" name="date" disabled>
                                            </div>

                                            <div class="form-group col-6">
                                                <label for=""> Market Develloper </label>
                                                <input type="text" class="form-control market_develloper" disabled>
                                            </div>

                                        </div>

                                        <div class="row border m-1 p-1">

                                            <div class="col-12 text-center p-1">
                                                <span class="font-weight-bold display-5"> ARTICLES </span>
                                            </div>

                                            <table class="table table-bordered table-striped">

                                                <thead>
                                                    <tr>
                                                        <th> Article </th>
                                                        <th> Quantite </th>
                                                        <th> Unité </th>
                                                        <th> Valeur </th>
                                                    </tr>
                                                </thead>

                                                <tbody class='fts lignedegustation'>

                                                    <tr>
                                                        <td> HEMLE POULET</td>
                                                        <td> 10 </td>
                                                        <td> paquet </td>
                                                        <td> 10 000 </td>
                                                    </tr>
                                                    <tr>
                                                        <td> HEMLE POULET</td>
                                                        <td> 10 </td>
                                                        <td> paquet </td>
                                                        <td> 10 000 </td>
                                                    </tr>

                                                </tbody>
                                            </table>

                                        </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>

                </div>
                
            </section>

        </div>

    
    </div>

<script>
    const degustations = <?= json_encode($degustations) ?>;
</script>

<?php require('template/import/foot.php'); ?>

