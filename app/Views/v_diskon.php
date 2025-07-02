<?= $this->extend('layout') ?>
<?= $this->section('content') ?>

<?php if (session()->getFlashData('success')) : ?>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('success') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<?php if (session()->getFlashData('failed')) : ?>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('failed') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addModal">
    Tambah Data Diskon
</button>

<!-- Table with stripped rows -->
<table class="table datatable">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Tanggal</th>
            <th scope="col">Nominal</th>
            <th scope="col">Dibuat Pada</th>
            <th scope="col">Diperbarui Pada</th>
            <th scope="col">Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($diskon as $index => $d) : ?>
            <tr>
                <th scope="row"><?= $index + 1 ?></th>
                <td><?= $d['tanggal'] ?></td>
                <td><?= number_to_currency($d['nominal'], 'IDR') ?></td>
                <td><?= $d['created_at'] ?></td>
                <td><?= $d['updated_at'] ?></td>
                <td>
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#editModal-<?= $d['id'] ?>">
                        Ubah
                    </button>
                    <a href="<?= base_url('diskon/delete/' . $d['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin hapus data ini ?')">
                        Hapus
                    </a>
                </td>
            </tr>
            <!-- Edit Modal Begin -->
            <div class="modal fade" id="editModal-<?= $d['id'] ?>" tabindex="-1" aria-labelledby="editModalLabel-<?= $d['id'] ?>" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel-<?= $d['id'] ?>">Edit Data Diskon</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="<?= base_url('diskon/edit/' . $d['id']) ?>" method="post">
                            <?= csrf_field(); ?>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="tanggal-edit-<?= $d['id'] ?>" class="form-label">Tanggal</label>
                                    <input type="date" name="tanggal" class="form-control" id="tanggal-edit-<?= $d['id'] ?>" value="<?= $d['tanggal'] ?>" readonly required>
                                </div>
                                <div class="mb-3">
                                    <label for="nominal-edit-<?= $d['id'] ?>" class="form-label">Nominal</label>
                                    <input type="number" name="nominal" class="form-control" id="nominal-edit-<?= $d['id'] ?>" value="<?= old('nominal', $d['nominal']) ?>" placeholder="Nominal Diskon" required min="1">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal End -->
        <?php endforeach ?>
    </tbody>
</table>
<!-- End Table with stripped rows -->

<!-- Add Modal Begin -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Tambah Data Diskon Baru</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<?= base_url('diskon') ?>" method="post">
                <?= csrf_field(); ?>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="tanggal-add" class="form-label">Tanggal</label>
                        <input type="date" name="tanggal" class="form-control" id="tanggal-add" value="<?= old('tanggal') ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="nominal-add" class="form-label">Nominal</label>
                        <input type="number" name="nominal" class="form-control" id="nominal-add" value="<?= old('nominal') ?>" placeholder="Nominal Diskon" required min="1">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Add Modal End -->
<?= $this->endSection() ?>