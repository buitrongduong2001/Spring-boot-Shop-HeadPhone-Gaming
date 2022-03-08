
<html>
<!DOCTYPE html>
<style>

</style>
<body>
<div style="font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif">
    <table align="center" cellpadding="0" cellspacing="0"
           style="background-color:#f2f2f2;margin:auto;border-collapse:collapse;width:100%;color:#222">
        <tbody>
        <tr>
            <td style="padding:20px 30px;width:auto">
                <table cellpadding="0" cellspacing="0"
                       style="border-collapse:collapse;background:#fff;width:800px;margin:auto">

                    <tbody>
                    <tr>
                        <td style="background:linear-gradient(to right,#9b6e0e,#e02808)">
                            <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;width:100%">
                                <tbody>
                                <tr>

                                    <td style="color:#fff;padding:10px 20px">
                                        <h1 style="font-size:1.2em">Thông tin đơn hàng tại Shop HeadPhone</h1>
                                    </td>

                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <tr style="border-bottom:2px dashed #ddd">
                        <td style="padding:1em 20px 1.5em 20px">
                            <h2 style="font-size:1em">ID Đơn hàng: <span style="color: red; font-weight: 700;">${sanPham.codeOrder}</span></h2>
                            <h2 style="font-size:1em">Cảm ơn quý khách <span class="name-user">${sanPham.customerName}</span> đã đặt hàng tại Shop HeadPhone</h2>

                            Shop HeadPhone rất vui mừng thông báo rằng đơn hàng của quý khách đã được tiếp nhận và đang
                            trong quá trình xử lý. Nhân viên của Shop HeadPhone sẽ gọi điện cho quý khách để xác nhận
                            trong thời gian sớm nhất.
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0"
                                   style="border-collapse:collapse;font-size:12px">
                                <tbody>
                                <tr>
                                    <td
                                            style="padding-left:20px;padding-right:20px;padding-bottom:30px;padding-top:10px">
                                        <h3>Thông tin khách hàng</h3>
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td>Tên khách hàng: </td>
                                                <td>${sanPham.customerName}</td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ email: </td>
                                                <td>${sanPham.customerEmail}</td>
                                            </tr>
                                            <tr>
                                                <td>Điện thoại: </td>
                                                <td >${sanPham.customerPhone}</td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ: </td>
                                                <td>${sanPham.customerAddress}</td>
                                            </tr>
                                            <tr>
                                                <td>Khách hàng ghi chú: </td>
                                                <td>${sanPham.note}</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <h3>Nội dung đặt hàng</h3>
                                        <table id="m_5417975229659139961nddh"
                                               style="border-collapse:collapse;width:100%;color:#333"
                                               border="1">

                                            <tbody>
                                            <tr style="background-color:#fc0;font-weight:bold">
                                                <td style="padding:4px">STT</td>
                                                <td style="padding:4px">Sản phẩm</td>
                                                <td style="padding:4px">Đơn giá</td>
                                                <td style="padding:4px">Số lượng</td>
                                                <td style="padding:4px">Tổng tiền</td>
                                            </tr>
                                            <#list listPro as data>
                                            <tr>
                                                <td style="padding:4px">${data?counter}  </td>
                                                <td style="padding:4px">
                                                    <b>${data.products.title}</b>
                                                </td>
                                                <td style="padding:4px">
                                                    <#if data.products.priceSale?has_content>
                                                        ${data.products.priceSale} đ
                                                    <#else>
                                                        ${data.products.price} đ
                                                    </#if>

                                                </td>
                                                <td style="padding:4px" >${data.quality}</td>
                                                <td style="padding:4px;font-weight:bold">
                                                    <#if data.products.priceSale?has_content>
                                                        ${data.products.priceSale * data.quality} đ
                                                    <#else>
                                                        ${data.products.price * data.quality} đ
                                                    </#if>
                                                </td>
                                            </tr>
                                            </#list>
                                            <tr>
                                                <td colspan="3" align="right"
                                                    style="padding:4px;text-align:right">
                                                    Thanh toán
                                                </td>
                                                <td colspan="2"
                                                    style="padding:4px;font-weight:bold;color:#e00">
                                                    ${sanPham.total} đ
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>

                                    </td>
                                </tr>
                                </tbody>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="min-height:1px;max-height:1px;height:1px;line-height:1px;background:#b3e4fc">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</div>
</body>
</html>