<%@include file="header.jsp" %> 

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart
        </div>

        <div class="feat_prod_box_details">
            &gt;&gt; <%= session.getAttribute("username") %>
            <br />
            <table class="cart_table">
                <tr class="cart_title">
                    <td>Item pic</td>
                    <td>Product name</td>
                    <td>Unit price</td>
                    <td>Qty</td>
                    <td>Total</td>
                </tr>

				<% List < Pet > pet_order = (List<Pet>)request.getAttribute("pet_order");
					for(int i=0;i<pet_order.size();i++)
					{
					%>
                    <tr>
                        <td>
                            <a href="details.do?id=<%= pet_order.get(i).getPet_id() %>"><img src="images/<%= pet_order.get(i).getPet_images() %>" alt="" title="" border="0" class="cart_thumb" width="50%" /></a>
                        </td>
                        <td><%= pet_order.get(i).getPet_name() %></td>
                        <td><%= pet_order.get(i).getPrice() %>$</td>
                        <td>1</td>
                        <td><%= pet_order.get(i).getPrice() %>$</td>
                    </tr>
                <% } %>

                <tr>
                    <td colspan="4" class="cart_total"><span class="red">TOTAL SHIPPING:</span></td>
                    <td><%= request.getAttribute("total").toString() %>$</td>
                </tr>

                <tr>
                    <td colspan="4" class="cart_total"><span class="red">TOTAL:</span></td>
                    <td><%= request.getAttribute("total").toString() %>$</td>
                </tr>
            </table>
            <a href="#" class="continue">&lt; continue</a>
            <a href="#" class="checkout">checkout &gt;</a>
        </div>

        <div class="clear"></div>
    </div>
    <!--end of left content-->

    <!--end of left content-->
    <%@include file="right_content.jsp" %>
    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp" %>
