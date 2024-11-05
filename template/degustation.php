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
                                        <span class="info-box-number"> <?= $Total ?> </span>

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
                                        <span class="info-box-number"> <?= $Nbre ?> </span>

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
                                        <span class="info-box-number"> <?= $moyenne ?> </span>

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
                                    <span class="info-box-number"> <?= "" ?> </span>

                                    <div class="progress">
                                        <div class="progress-bar" style="width: 00%"></div>
                                    </div>
                                    <span class="progress-description">
                                    <?= "" ?> 
                                    </span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        </div>

                        <div class="card-body">

                        <table class="table table-bordered tableordered">

                                <thead>
                                    <tr>
                                        <th> Date </th>
                                        <th> Volume </th>
                                        <th> Valeur </th>
                                        <th> status </th>
                                        <th> ... </th>
                                    </tr>
                                </thead>

                                <tbody class='fts'>
                                
                                </tbody>

                        </table>

                        </div>

                    </div>

                </div>

            </section>

        </div>

    
    </div>

<script>
</script>

<?php require('template/import/foot.php'); ?>

