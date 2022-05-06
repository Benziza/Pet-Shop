<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.*" %>
<!--end of left content-->

    <div class="right_content">
        <div class="languages_box">
            <div id="google_translate_element"></div>

            <script type="text/javascript">
                function googleTranslateElementInit() {
                    new google.translate.TranslateElement({ pageLanguage: "en" }, "google_translate_element");
                }
            </script>

            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
        <div class="currency">
            <span class="red">Currency: </span>
            <a class="selected">GBP</a>
            <a class="selected">EUR</a>
            <a class="selected">USD</a>
        </div>

        <div class="cart">
        	<% if(session.getAttribute("userid")!=null)
        		{
        		%>
                <div class="title">
                    <span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>My cart
                </div>
                <div class="home_cart_content">
                    <span class="red"><%= session.getAttribute("username") %></span>
                </div>
                <a href="cart.do?userid=<%= session.getAttribute("userid") %>" class="view_cart">view cart</a>
            <% } %>
        </div>

        <div class="title">
            <span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Shop
        </div>
        <div class="about">
            <p>
                <img src="images/about.gif" alt="" title="" class="right" />
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
            </p>
        </div>

        <div class="right_box">
            <div class="title">
                <span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions
            </div>

			<% List < Pet > petsRightContent = (List<Pet>)request.getAttribute("modelPets");%>
    		<% for(int i=0;i<petsRightContent.size();i++)
    		{
    			if(petsRightContent.get(i).getPet_status().equals("promo"))
    			{
        	%>
                    <div class="new_prod_box">
                        <a href="details.do?id=<%= petsRightContent.get(i).getPet_id() %>"><%= petsRightContent.get(i).getPet_name() %></a>
                        <div class="new_prod_bg">
                            <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                            <a href="details.do?id=<%= petsRightContent.get(i).getPet_id() %>"><img src="images/<%= petsRightContent.get(i).getPet_images() %>" alt="" title="" class="thumb" border="0" /></a>
                        </div>
                    </div>
			<%
    			}
			} %>
        </div>

        <div class="right_box">
            <div class="title">
                <span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories
            </div>

            <ul class="list">
            	<% List < Category > categorysRightContent = (List<Category>)request.getAttribute("modelCategorys");
		    		for(int i=0;i<categorysRightContent.size();i++)
		    		{
		    	%>
                    <li><a href="category.do?id=<%= categorysRightContent.get(i).getPet_category_id() %>"><%= categorysRightContent.get(i).getPet_category_name() %></a></li>
				<% } %>
            </ul>
            <div class="title">
                <span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>Partners
            </div>

            <ul class="list">
		    		<%for(int i=0;i<categorysRightContent.size();i++)
		    		{
		    	%>
                    <li><a href="category.do?id=<%= categorysRightContent.get(i).getPet_category_id() %>"><%= categorysRightContent.get(i).getPet_category_name() %></a></li>
				<% } %>
            </ul>
        </div>
    </div>
    <!--end of right content-->