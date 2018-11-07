package myparsing;
//�Ľ��� ó���� DTOŬ����
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.javalec.ex.dto.BDto_book;


public class ParsingProcess {

	String url;
	ArrayList<BDto_book> bookList;

	
	public ParsingProcess(String url) throws UnsupportedEncodingException {
		//this.url = URLEncoder.encode(url, "UTF-8");
		this.url = url;
		bookList = new ArrayList<BDto_book>();
	}
	
	
	
	// tag���� ������ �������� �޼ҵ�
		private static String getTagValue(String tag, Element item) {
		    NodeList nlList = item.getElementsByTagName(tag).item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();
		}
	
	
	
	
	//tag�� �ִ� �����͸� �Ľ�ó���ϴ� �޼ҵ�
	public ArrayList<BDto_book> process() throws ParserConfigurationException, SAXException, IOException {
		
		
		
		//url�� �ش��ϴ� �������� �������� ���� document��ü�� �����Ͽ� �������� ���� ---------------SAX���?DOM���?
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		//Document doc = dBuilder.parse(new FileInputStream(url));
	
		
		// root tag�� �̾ƺ���. ���� <channel>�̴�.
		doc.getDocumentElement().normalize();
		System.out.println("DTO�� �Ѿ�� URL : "+url);
		System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
		
		// �Ľ��� tag�� ���� List��ü�� �غ��Ͽ� ���� �ʿ��� �����Ͱ� ����ִ� xml������ element�� �̾Ƴ��� �ִ´�
		NodeList nList = doc.getElementsByTagName("item");//�±��̸��� �̿��� �Ľ��� ��ҵ��� �̾Ƽ� �±׵��� ���� List�� ��´�.
		System.out.println("�Ľ��� ����Ʈ �� : "+ nList.getLength());  // �Ľ��� ����Ʈ �� :  num
		
		//Node nNode = nList.item(0);
		//System.out.println(nNode.getTextContent());
		
	
		
		for(int temp = 0; temp < nList.getLength(); temp++){		
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
								
				Element item = (Element) nNode;
				BDto_book book = new BDto_book();
				
				book.setTitle(getTagValue("title", item));
				book.setDescription(getTagValue("description", item));
				book.setPubDate(getTagValue("pubDate",item));
				book.setPriceStandard(getTagValue("priceStandard", item));
				book.setPriceSales(getTagValue("priceSales", item));
				book.setDiscountRate(getTagValue("discountRate", item));
				book.setSaleStatus(getTagValue("saleStatus", item));
				book.setCustomerReviewRank(getTagValue("customerReviewRank", item));
				book.setAuthor(getTagValue("author", item));
				book.setImage(getTagValue("coverSmallUrl", item));
				book.setLink(getTagValue("link", item));
				
				bookList.add(book);
			}	
			
		}	 
		
		return bookList;
	
	}
	
	
}
