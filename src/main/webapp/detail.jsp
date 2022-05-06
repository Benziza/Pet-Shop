<%@include file="header.jsp" %> 
<%@ page import="beans.*" %>

<% Pet pet_selected = (Pet)request.getAttribute("pet_selected"); %>

<div class="center_content">
    <div class="left_content">
        <div class="crumb_nav"><a href="index.do">home</a> &gt;&gt; <%= pet_selected.getPet_name() %></div>
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Product name
        </div>
		
        <div class="feat_prod_box_details">
            <div class="prod_img">
                <a><img src="images/<%= pet_selected.getPet_images() %>" alt="" title="" border="0" /></a> <br />
                <br />
                <a href="images/${pet_selected.getPet_images()}" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
            </div>

            <div class="prod_det_box">
                <div class="box_top"></div>
                <div class="box_center">
                    <div class="prod_title">Details</div>
                    <p class="details"><%= pet_selected.getPet_description() %></p>
                    <div class="price"><strong>PRICE:</strong> <span class="red"><%= pet_selected.getPrice() %>$</span></div>
                    <div class="price">
                        <strong>COLORS:</strong>
                        <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span>
                        <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span>
                        <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>
                    </div>
						
					<% if(session.getAttribute("userid")!=null)
						{
						%>
                        <a href="order.do?userid=<%= session.getAttribute("userid") %>&pet_id=<%= pet_selected.getPet_id() %>" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
					<% } %>
					<% if(session.getAttribute("userid")==null)
						{
						%>
                        <a href="myaccount.do" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                    <% } %>

                    <div class="clear"></div>
                </div>

                <div class="box_bottom"></div>
            </div>
            <div class="clear"></div>
        </div>

        <div id="demo" class="demolayout">
            <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">More details</a></li>
            </ul>

            <div class="tabs-container">
                <div style="display: block;" class="tab" id="tab1">
                    <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                    <ul class="list">
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                    </ul>
                    <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                </div>
            </div>
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