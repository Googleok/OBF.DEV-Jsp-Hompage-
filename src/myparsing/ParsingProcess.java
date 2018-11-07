package myparsing;
//파싱을 처리할 DTO클래스
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
	
	
	
	// tag값의 정보를 가져오는 메소드
		private static String getTagValue(String tag, Element item) {
		    NodeList nlList = item.getElementsByTagName(tag).item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();
		}
	
	
	
	
	//tag에 있는 데이터를 파싱처리하는 메소드
	public ArrayList<BDto_book> process() throws ParserConfigurationException, SAXException, IOException {
		
		
		
		//url에 해당하는 페이지를 가져오기 위해 document객체를 생성하여 페이지에 접근 ---------------SAX방식?DOM방식?
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		//Document doc = dBuilder.parse(new FileInputStream(url));
	
		
		// root tag를 뽑아본다. 나는 <channel>이다.
		doc.getDocumentElement().normalize();
		System.out.println("DTO로 넘어온 URL : "+url);
		System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
		
		// 파싱할 tag를 담을 List객체를 준비하여 내가 필요한 데이터가 들어있는 xml문서의 element를 뽑아내서 넣는다
		NodeList nList = doc.getElementsByTagName("item");//태그이름을 이용해 파싱할 요소들을 뽑아서 태그들을 담을 List에 담는다.
		System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수 :  num
		
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
