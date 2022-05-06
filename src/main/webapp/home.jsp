
<%@include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.*" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Featured pets
        </div>
        
       	<% List < Pet > petsHome = (List<Pet>)request.getAttribute("modelPets");
       		for(int i=0;i<petsHome.size();i++)
       		{
       			if(petsHome.get(i).getPet_id()%5==0)
       			{
       	%>     	  	
                <div class="feat_prod_box">
                    <div class="prod_img">
                        <a href="details.do?id=<%= petsHome.get(i).getPet_id() %>"><img src="images/<%= petsHome.get(i).getPet_images() %>" alt="" title="" border="0" /></a>
                    </div>

                    <div class="prod_det_box">
                        <div class="box_top"></div>
                        <div class="box_center">
                            <div class="prod_title"><%= petsHome.get(i).getPet_name() %></div>
                            <p class="details"><%= petsHome.get(i).getPet_description() %></p>
                            <a href="details.do?id=<%= petsHome.get(i).getPet_id() %>" class="more">- more details -</a>
                            <div class="clear"></div>
                        </div>

                        <div class="box_bottom"></div>
                    </div>
                    <div class="clear"></div>
                </div>
        <%
       			}
       		}
        %>

        <div class="title">
            <span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>New pets
        </div>

        <div class="new_products">
            	<%for(int i=0;i<petsHome.size();i++)
           		{
           			if(petsHome.get(i).getPet_status().equals("new"))
           			{ 
           		%>
                    <div class="new_prod_box">
                        <a href="details.do?id=<%= petsHome.get(i).getPet_id() %>"><%= petsHome.get(i).getPet_name() %></a>
                        <div class="new_prod_bg">
                            <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                            <a href="details.do?id=<%= petsHome.get(i).getPet_id() %>"><img src="images/<%= petsHome.get(i).getPet_images() %>" alt="" title="" class="thumb" border="0" /></a>
                        </div>
                    </div>
                <% }} %>
        </div>

        <div class="clear"></div>
    </div>
    <!--end of left content-->
    <%@include file="right_content.jsp" %>
    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp" %>