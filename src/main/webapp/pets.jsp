<%@include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Pet" %>


<div class="center_content">
    <div class="left_content">
        <div class="crumb_nav">
            <a href="index.do">home</a>
        </div>
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Category books
        </div>

        <div class="new_products">
        	<%  List<Pet> petsPets = (List<Pet>)request.getAttribute("modelPets"); %>
        	<%
        		for(int i=0;i<petsPets.size();i++)
        		{	
            %> 
                <div class="new_prod_box">
                    <a href="details.do?id=<%= petsPets.get(i).getPet_id() %>"><%= petsPets.get(i).getPet_name() %></a>
                    <div class="new_prod_bg">
                        <a href="details.do?id=<%= petsPets.get(i).getPet_id() %>"><img src="images/<%= petsPets.get(i).getPet_images() %>" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
			<%  } %>
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