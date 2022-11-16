<?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <tr class="status-<?php echo e($order['order_status']); ?> class-all">
        <td class="">
            <?php echo e($key+1); ?>

        </td>
        <td class="table-column-pl-0">
            <a href="<?php echo e(route('vendor.order.details',['id'=>$order['id']])); ?>"><?php echo e($order['id']); ?></a>
        </td>
        <td><?php echo e(date('d M Y',strtotime($order['created_at']))); ?></td>
        <td>
            <?php if($order->customer): ?>
                <a class="text-body text-capitalize"
                    href="<?php echo e(route('vendor.order.details',['id'=>$order['id']])); ?>"><?php echo e($order->customer['f_name'].' '.$order->customer['l_name']); ?></a>
            <?php else: ?>
                <label
                    class="badge badge-danger"><?php echo e(__('messages.invalid')); ?> <?php echo e(__('messages.customer')); ?> <?php echo e(__('messages.data')); ?></label>
            <?php endif; ?>
        </td>
        <td>
            <?php if($order->payment_status=='paid'): ?>
                <span class="badge badge-soft-success">
                    <span class="legend-indicator bg-success"></span><?php echo e(__('messages.paid')); ?>

                </span>
            <?php else: ?>
                <span class="badge badge-soft-danger">
                    <span class="legend-indicator bg-danger"></span><?php echo e(__('messages.unpaid')); ?>

                </span>
            <?php endif; ?>
        </td>
        <td><?php echo e(\App\CentralLogics\Helpers::format_currency($order['order_amount'])); ?></td>
        <td class="text-capitalize">
            <?php if($order['order_status']=='pending'): ?>
                <span class="badge badge-soft-info ml-2 ml-sm-3">
                    <span class="legend-indicator bg-info"></span><?php echo e(__('messages.pending')); ?>

                </span>
            <?php elseif($order['order_status']=='confirmed'): ?>
                <span class="badge badge-soft-info ml-2 ml-sm-3">
                    <span class="legend-indicator bg-info"></span><?php echo e(__('messages.confirmed')); ?>

                </span>
            <?php elseif($order['order_status']=='processing'): ?>
                <span class="badge badge-soft-warning ml-2 ml-sm-3">
                    <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.processing')); ?>

                </span>
            <?php elseif($order['order_status']=='out_for_delivery'): ?>
                <span class="badge badge-soft-warning ml-2 ml-sm-3">
                    <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.out_for_delivery')); ?>

                </span>
            <?php elseif($order['order_status']=='delivered'): ?>
                <span class="badge badge-soft-success ml-2 ml-sm-3">
                    <span class="legend-indicator bg-success"></span><?php echo e(__('messages.delivered')); ?>

                </span>
            <?php else: ?>
                <span class="badge badge-soft-danger ml-2 ml-sm-3">
                    <span class="legend-indicator bg-danger"></span><?php echo e(str_replace('_',' ',$order['order_status'])); ?>

                </span>
            <?php endif; ?>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                        href="<?php echo e(route('vendor.order.details',['id'=>$order['id']])); ?>"><i
                            class="tio-visible"></i> <?php echo e(__('messages.view')); ?></a>
            <a class="btn btn-sm btn-white" target="_blank"
                        href="<?php echo e(route('vendor.order.generate-invoice',[$order['id']])); ?>"><i
                            class="tio-download"></i> <?php echo e(__('messages.invoice')); ?></a>
        </td>
    </tr>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/vendor-views/order/partials/_table.blade.php ENDPATH**/ ?>