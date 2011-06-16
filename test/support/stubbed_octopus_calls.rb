module TestHelper
  module StubbedOctopusCalls

    def stub_successful_net_resource_creation(feed)
      stub_request(:post, subscription_url).with(successful_subscription_request_body(feed))
    end

    def successful_subscription_request_body(feed)
      {
        :body => {
        :net_resource => {:url => feed.url},
        :subscription => {:url => "#{::SERVER_URL}/updates/notify/#{feed.id}"}
      }}
    end

    def subscription_url
      "http://admin:admin@localhost:2001/create"
    end

    def good_feed_content
      <<-feed
        <?xml version="1.0" encoding="UTF-8"?>
        <?xml-stylesheet title="XSL_formatting" type="text/xsl" href="/shared/bsp/xsl/rss/nolsol.xsl"?>

        <rss xmlns:media="http://search.yahoo.com/mrss/" xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
          <channel>
            <title>BBC News - Home</title>
            <link>http://www.bbc.co.uk/go/rss/int/news/-/news/</link>
            <description>The latest stories from the Home section of the BBC News web site.</description>
            <language>en-gb</language>
            <lastBuildDate>Thu, 11 Nov 2010 12:28:01 GMT</lastBuildDate>
            <copyright>Copyright: (C) British Broadcasting Corporation, see http://news.bbc.co.uk/2/hi/help/rss/4498287.stm for terms and conditions of reuse.</copyright>
            <docs>http://www.bbc.co.uk/syndication/</docs>
            <ttl>15</ttl>
            <atom:link href="http://feeds.bbci.co.uk/news/rss.xml" rel="self" type="application/rss+xml"/>
            <item>
              <title>New benefit system being unveiled</title>
              <description>Ministers are setting out how they plan to overhaul the benefits system to provide greater incentives for work and sanctions for those unwilling to do so.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11728546</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11728546</guid>
              <pubDate>Thu, 11 Nov 2010 10:42:59 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49886000/jpg/_49886404_008261655-1.jpg"/>
            </item>
            <item>
              <title>UK observes Armistice Day silence</title>
              <description>Millions of people across the country have observed a two-minute silence to mark Armistice Day.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-11731492</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-11731492</guid>
              <pubDate>Thu, 11 Nov 2010 12:06:50 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888617_010604757-1.jpg"/>
            </item>
            <item>
              <title>PM condemns fees protest violence</title>
              <description>David Cameron has condemned the violence during protests over tuition fees after the Met Police announced an investigation into how it was handled.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11732264</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11732264</guid>
              <pubDate>Thu, 11 Nov 2010 11:31:05 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49885000/jpg/_49885719_010611922-1.jpg"/>
            </item>
            <item>
              <title>Gascoigne misses court sentencing</title>
              <description>The sentencing of former footballer Paul Gascoigne for drink driving is adjourned after he fails to show up in court.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-england-tyne-11728764</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-england-tyne-11728764</guid>
              <pubDate>Thu, 11 Nov 2010 12:27:13 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49581000/jpg/_49581178_010456943-1.jpg"/>
            </item>
            <item>
              <title>Iraq parties in government 'deal'</title>
              <description>Iraq's parties have broken an eight-month deadlock over the formation of a new government, the man brokering negotiations says.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-middle-east-11732158</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-middle-east-11732158</guid>
              <pubDate>Thu, 11 Nov 2010 11:20:37 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49867000/jpg/_49867208_010603857-1.jpg"/>
            </item>
            <item>
              <title>Currencies to dominate G20 talks</title>
              <description>The world's leading economies begin a summit in South Korea, with currency policies set to dominate the agenda.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11731664</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11731664</guid>
              <pubDate>Thu, 11 Nov 2010 11:06:19 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889104_49889098.jpg"/>
            </item>
            <item>
              <title>NHS 'must improve elderly care'</title>
              <description>Hospitals must improve their care of elderly patients undergoing surgery, an independent review says.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/health-11728163</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/health-11728163</guid>
              <pubDate>Thu, 11 Nov 2010 00:39:59 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49879000/jpg/_49879913_elderly.jpg"/>
            </item>
            <item>
              <title>Continuing fall in repossessions</title>
              <description>The number of homes repossessed in the UK is continuing to fall as low interest rates help homeowners to afford mortgages.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11733556</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11733556</guid>
              <pubDate>Thu, 11 Nov 2010 10:44:45 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/48706000/jpg/_48706493_repos.jpg"/>
            </item>
            <item>
              <title>Amazon row over paedophile book</title>
              <description>A self-published guide for paedophiles that was on sale on online retailer Amazon stirs up controversy, with some threatening to boycott the site.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11731928</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11731928</guid>
              <pubDate>Thu, 11 Nov 2010 10:54:49 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888742_pedophile_book2.jpg"/>
            </item>
            <item>
              <title>Banner caused Farage plane crash</title>
              <description>A report into how a plane carrying UKIP leader Nigel Farage crashed on election day says the banner being towed behind became entangled round the tail.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-england-northamptonshire-11730133</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-england-northamptonshire-11730133</guid>
              <pubDate>Thu, 11 Nov 2010 02:11:31 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49885000/jpg/_49885534_farage.jpg"/>
            </item>
            <item>
              <title>MPs condemn family court service</title>
              <description>The organisation which provides legal help for children in care cases is "not fit for purpose", a group of MPs says.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/education-11731484</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/education-11731484</guid>
              <pubDate>Thu, 11 Nov 2010 03:46:58 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/48499000/jpg/_48499343_48499346.jpg"/>
            </item>
            <item>
              <title>Lichtenstein piece fetches record price</title>
              <description>Roy Lichtenstein's Ohhh... Alright... is sold at auction at Christie's New York for $42.6m (26.4m), a record for the US pop artist.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11732551</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11732551</guid>
              <pubDate>Thu, 11 Nov 2010 09:35:05 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49890000/jpg/_49890207_010394240-1.jpg"/>
            </item>
            <item>
              <title>Judge gives Renault's 'Zoe' green light</title>
              <description>A judge says French carmaker Renault can name a new model Zoe - throwing out a case brought by parents of two girls who said they could face a lifetime of teasing.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-europe-11732595</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-europe-11732595</guid>
              <pubDate>Thu, 11 Nov 2010 08:24:57 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889639_010610424-1.jpg"/>
            </item>
            <item>
              <title>Referee to review Barton 'punch'</title>
              <description>Referee Michael Jones is to look at a video replay of the incident where Joey Barton appeared to punch Morten Gamst Pedersen - with Barton facing a possible ban.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/sport1/hi/football/eng_prem/9178056.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/sport1/hi/football/eng_prem/9178056.stm</guid>
              <pubDate>Thu, 11 Nov 2010 11:30:59 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888413_010613383-1.jpg"/>
            </item>
            <item>
              <title>Ferguson frustrated by derby draw</title>
              <description>Manchester United manager Sir Alex Ferguson is disappointed with his side's 0-0 draw at Manchester City, saying his team "needed to win".</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/sport1/hi/football/eng_prem/9170997.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/sport1/hi/football/eng_prem/9170997.stm</guid>
              <pubDate>Thu, 11 Nov 2010 07:03:55 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49890000/jpg/_49890922_010613053-1.jpg"/>
            </item>
            <item>
              <title>England 'gambling' over Cook form</title>
              <description>Former Australia captain Ian Chappell believes England's decision to put faith in Alastair Cook for the Ashes is "a hell of a gamble".</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/sport1/hi/cricket/england/9179833.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/sport1/hi/cricket/england/9179833.stm</guid>
              <pubDate>Thu, 11 Nov 2010 12:08:31 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49894000/jpg/_49894386_cook_pa226i.jpg"/>
            </item>
            <item>
              <title>I'll quit if I'm fined - Holloway</title>
              <description>Blackpool manager Ian Holloway says he will resign if the Premier League punish him for fielding a weakened team in the 3-2 defeat against Aston Villa.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/sport1/hi/football/teams/b/blackpool/9178229.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/sport1/hi/football/teams/b/blackpool/9178229.stm</guid>
              <pubDate>Thu, 11 Nov 2010 09:02:07 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888277_010612748-2.jpg"/>
            </item>
            <item>
              <title>Teenager North handed Wales cap</title>
              <description>Scarlets wing George North wins his first cap for Wales' clash against world champions South Africa on Saturday.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/sport1/hi/rugby_union/welsh/9164712.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/sport1/hi/rugby_union/welsh/9164712.stm</guid>
              <pubDate>Thu, 11 Nov 2010 11:47:03 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49890000/jpg/_49890493_george_north_train_huw.jpg"/>
            </item>
            <item>
              <title>Officer cleared of make-up theft</title>
              <description>A senior Nottinghamshire police officer is cleared of stealing foundation from a Tesco store.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-england-nottinghamshire-11732718</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-england-nottinghamshire-11732718</guid>
              <pubDate>Thu, 11 Nov 2010 12:01:24 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49875000/jpg/_49875988_010607909-1.jpg"/>
            </item>
            <item>
              <title>Severe gales warning put in place</title>
              <description>The Met Office says winds of up to 80mph (129km/h) could cause disruption in parts of northern England and north Wales overnight.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-11734050</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-11734050</guid>
              <pubDate>Thu, 11 Nov 2010 12:04:57 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49893000/jpg/_49893359_000899201-1.jpg"/>
            </item>
            <item>
              <title>Swinney in radical spending move</title>
              <description>The Scottish government is planning a radical shift in its spending priorities, BBC Scotland learns.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-scotland-11732814</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-scotland-11732814</guid>
              <pubDate>Thu, 11 Nov 2010 08:18:35 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49024000/jpg/_49024833_007112725-1.jpg"/>
            </item>
            <item>
              <title>Nurses 'damaging their uniforms'</title>
              <description>NHS staff are going to extraordinary lengths to get hold of the new tunic-style uniform, BBC Scotland learns.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-scotland-11730212</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-scotland-11730212</guid>
              <pubDate>Thu, 11 Nov 2010 06:30:21 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49883000/jpg/_49883951_nurses304.jpg"/>
            </item>
            <item>
              <title>Paterson signals end for 50-50</title>
              <description>The NI Secretary of State says he is "not minded" to continue the practice of 50-50 recruitment within the PSNI.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-northern-ireland-11732911</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-northern-ireland-11732911</guid>
              <pubDate>Thu, 11 Nov 2010 11:18:58 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49891000/jpg/_49891152__47839363_patterson-1.jpg"/>
            </item>
            <item>
              <title>Decision due on Finucane inquiry</title>
              <description>The Secretary of State says he will decide in the new year whether there should be a public inquiry into the murder of Pat Finucane.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-northern-ireland-11733461</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-northern-ireland-11733461</guid>
              <pubDate>Thu, 11 Nov 2010 12:23:36 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49894000/jpg/_49894728__48681928__38083002_patrick_finucane_150-1-1.jpg"/>
            </item>
            <item>
              <title>Jailed rape claim wife to appeal</title>
              <description>A woman jailed for repeatedly making and then dropping rape charges against her husband is to appeal her conviction.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-wales-11727763</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-wales-11727763</guid>
              <pubDate>Thu, 11 Nov 2010 06:35:12 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/47889000/jpg/_47889728_court66.jpg"/>
            </item>
            <item>
              <title>'Severe weather' warning issued</title>
              <description>The Met Office issues a severe weather warning for Anglesey as bad weather affects transport across Wales.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-wales-11732724</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-wales-11732724</guid>
              <pubDate>Thu, 11 Nov 2010 11:47:24 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/46729000/jpg/_46729651_000510840-1.jpg"/>
            </item>
            <item>
              <title>First carbon exchange for Africa</title>
              <description>Kenya is to launch a climate exchange platform to facilitate the trading of carbon credits that may open up investment in renewable energy - the first such scheme in Africa.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/science-environment-11733765</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/science-environment-11733765</guid>
              <pubDate>Thu, 11 Nov 2010 10:52:14 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49891000/jpg/_49891342_sierra466photoshop.jpg"/>
            </item>
            <item>
              <title>Somalis deny US piracy charges</title>
              <description>Five Somali men accused of attacking a US warship deny charges of piracy in what is billed as the first such trial in the US in more than 100 years.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11717877</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11717877</guid>
              <pubDate>Thu, 11 Nov 2010 11:14:47 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/47706000/jpg/_47706723_009163734-1.jpg"/>
            </item>
            <item>
              <title>Australia migrants gain legal win</title>
              <description>The Australian High Court rules in favour of asylum-seekers who claimed laws barring appeal against refugee status rejections were unfair.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-asia-pacific-11732148</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-asia-pacific-11732148</guid>
              <pubDate>Thu, 11 Nov 2010 10:20:00 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49169000/jpg/_49169726_010002134-1.jpg"/>
            </item>
            <item>
              <title>Suu Kyi detention appeal rejected</title>
              <description>A Burmese court rejects Aung San Suu Kyi's appeal against detention, as speculation mounts over her possible release within days.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-asia-pacific-11732151</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-asia-pacific-11732151</guid>
              <pubDate>Thu, 11 Nov 2010 07:22:06 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49873000/jpg/_49873693_010609237-1.jpg"/>
            </item>
            <item>
              <title>Paper names Russia 'double agent'</title>
              <description>A Moscow newspaper names the Russian intelligence agent it claims helped the US break up a Russian spy ring last summer.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-europe-11734424</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-europe-11734424</guid>
              <pubDate>Thu, 11 Nov 2010 11:16:21 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49894000/jpg/_49894463_203-1.jpg"/>
            </item>
            <item>
              <title>Battle looms over EU budget rise</title>
              <description>European governments brace for a battle with MEPs and the EU Commission over the size of the 2011 EU budget.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-europe-11733644</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-europe-11733644</guid>
              <pubDate>Thu, 11 Nov 2010 11:16:47 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49892000/jpg/_49892906_flagsafp.jpg"/>
            </item>
            <item>
              <title>Cuba condemns Castro video game</title>
              <description>Cuba has condemned the release of a new video game in which United States special forces try to kill a young Fidel Castro.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-latin-america-11731120</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-latin-america-11731120</guid>
              <pubDate>Thu, 11 Nov 2010 01:51:03 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888079_fidel-3.jpg"/>
            </item>
            <item>
              <title>Cholera death toll rises in Haiti</title>
              <description>Fears are growing in Haiti over the spread of cholera, as the death toll rises to 644 across the poverty-stricken nation.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-latin-america-11729765</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-latin-america-11729765</guid>
              <pubDate>Wed, 10 Nov 2010 22:15:38 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49885000/jpg/_49885910_010607220-1.jpg"/>
            </item>
            <item>
              <title>Yemen mail bomb 'timed to hit US'</title>
              <description>Tests on a failed parcel bomb discovered on US-bound cargo flight suggest it was timed to have detonated over the eastern US seaboard, say British police.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11729720</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11729720</guid>
              <pubDate>Wed, 10 Nov 2010 22:30:34 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49883000/jpg/_49883653_010523542-1.jpg"/>
            </item>
            <item>
              <title>Easing blockade 'no help' to Gaza</title>
              <description>The UN says there has been no material change for people in Gaza since Israel eased its blockade of the Palestinian territory.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-middle-east-11731695</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-middle-east-11731695</guid>
              <pubDate>Thu, 11 Nov 2010 00:25:21 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888387_010373927-2.jpg"/>
            </item>
            <item>
              <title>Pakistan in $700m flood tax move</title>
              <description>Pakistan announces mid-year measures to raise more than $700m (435m) to support people affected by the monsoon floods over the summer.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-south-asia-11733103</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-south-asia-11733103</guid>
              <pubDate>Thu, 11 Nov 2010 12:19:45 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49894000/jpg/_49894342_010454931-1.jpg"/>
            </item>
            <item>
              <title>Hollywood-Bollywood pact signed</title>
              <description>The world's two leading movie industries, America's Hollywood and India's Bollywood, sign a deal to bolster production, distribution and commercial ties.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-south-asia-11732164</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-south-asia-11732164</guid>
              <pubDate>Thu, 11 Nov 2010 05:34:37 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889059_khanfilmproap304.jpg"/>
            </item>
            <item>
              <title>Northernmost Canada mosque opens</title>
              <description>The northernmost mosque in North America opens in Inuvik, in Canada's Northwest Territories, where there is a growing Muslim population.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11731017</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11731017</guid>
              <pubDate>Thu, 11 Nov 2010 07:46:47 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49887000/jpg/_49887994_49887987.jpg"/>
            </item>
            <item>
              <title>Disabled liner towed toward shore</title>
              <description>A disabled cruise ship that caught fire off the coast of Mexico is approaching the US city of San Diego and is expected to arrive within 24 hours.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11731020</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11731020</guid>
              <pubDate>Thu, 11 Nov 2010 02:13:38 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888635_49888053.jpg"/>
            </item>
            <item>
              <title>Scammers 'using consumer laws'</title>
              <description>Consumer protection laws are being exploited as part of an elaborate new type of ticketing scam, the BBC has learnt.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11715225</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11715225</guid>
              <pubDate>Thu, 11 Nov 2010 00:19:12 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889163_ticketsafe.jpg"/>
            </item>
            <item>
              <title>Spurs in red after player trading</title>
              <description>Tottenham Hotspur made a loss for the financial year, despite record revenue, partly due to a loss on player trading.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11733227</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11733227</guid>
              <pubDate>Thu, 11 Nov 2010 11:46:24 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/44936000/gif/_44936217_tottenham_66x49.gif"/>
            </item>
            <item>
              <title>Wealth 'hit by financial crisis'</title>
              <description>Official statistics have revealed the extent to which household wealth was hit by the financial crisis.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11735664</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11735664</guid>
              <pubDate>Thu, 11 Nov 2010 12:09:57 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49893000/jpg/_49893904_cash.jpg"/>
            </item>
            <item>
              <title>Clegg regrets making fees pledge</title>
              <description>Nick Clegg admits he should have been more careful about signing the tuition fees pledge ahead of the election.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11732787</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11732787</guid>
              <pubDate>Thu, 11 Nov 2010 12:22:43 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49883000/jpg/_49883474_clegg304in_pa.jpg"/>
            </item>
            <item>
              <title>Warning over election vote chaos</title>
              <description>Ministers are warned they are missing an opportunity to stop people being denied the vote, as happened in May's general election.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11728543</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11728543</guid>
              <pubDate>Thu, 11 Nov 2010 01:57:09 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/47792000/jpg/_47792886_queues_662pic.jpg"/>
            </item>
            <item>
              <title>Ex-MPs lose expenses trial appeal</title>
              <description>Three former Labour MPs should face criminal trials over their expenses claims, the Supreme Court has ruled.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11724838</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11724838</guid>
              <pubDate>Wed, 10 Nov 2010 10:39:39 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49549000/jpg/_49549998_supremecourt304in_bbc.jpg"/>
            </item>
            <item>
              <title>Inquiry hospital's 'poor systems'</title>
              <description>Stafford Hospital's regulation systems were "wholly ineffective", a public inquiry is told.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-england-stoke-staffordshire-11730042</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-england-stoke-staffordshire-11730042</guid>
              <pubDate>Wed, 10 Nov 2010 17:52:57 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49848000/jpg/_49848237_010596426-2.jpg"/>
            </item>
            <item>
              <title>Developing world in obesity alert</title>
              <description>Developing countries should act now to head off their own "obesity epidemic", says a global policy group.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/health-11730091</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/health-11730091</guid>
              <pubDate>Thu, 11 Nov 2010 00:59:08 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49883000/jpg/_49883392_c0014138-obesity_clinic_patient-spl.jpg"/>
            </item>
            <item>
              <title>Stem cell jab 'may boost muscle'</title>
              <description>Muscle wasting linked to old age might one day be treated using stem cells, claim US scientists.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/health-11730068</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/health-11730068</guid>
              <pubDate>Thu, 11 Nov 2010 00:10:44 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49457000/jpg/_49457183__48104813_stems-1.jpg"/>
            </item>
            <item>
              <title>Fees boost for foreigners - PM</title>
              <description>The increase in student tuition fees in England means future rises in foreign students' charges should be kept lower, UK Prime Minister David Cameron says.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-politics-11724431</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-politics-11724431</guid>
              <pubDate>Wed, 10 Nov 2010 14:25:31 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49870000/jpg/_49870385_010602838-1.jpg"/>
            </item>
            <item>
              <title>School problems 'link to alcohol'</title>
              <description>Pupils who dislike school are more likely to drink alcohol, a study suggests</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/education-11718975</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/education-11718975</guid>
              <pubDate>Wed, 10 Nov 2010 00:51:14 GMT</pubDate>
            </item>
            <item>
              <title>Payout for voice damage teacher</title>
              <description>An English teacher who suffered permanent damage after being forced to raise her voice to be heard in class is awarded a 156,000 payout.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-england-london-11720712</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-england-london-11720712</guid>
              <pubDate>Tue, 09 Nov 2010 17:26:10 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49866000/jpg/_49866753_joyceleft.jpg"/>
            </item>
            <item>
              <title>US networks unite against Google</title>
              <description>Google's plans to link TV viewing to the web suffer a blow as Fox joins other US TV networks in block the search giant from running its shows.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/technology-11733566</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/technology-11733566</guid>
              <pubDate>Thu, 11 Nov 2010 10:19:48 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/47888000/jpg/_47888629_google_sign.jpg"/>
            </item>
            <item>
              <title>Google offers Samaritans link-up</title>
              <description>Google launches a new feature, offering users a prominent phone contact for Samaritans when they search for the word "suicide".</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/technology-11734269</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/technology-11734269</guid>
              <pubDate>Thu, 11 Nov 2010 11:25:24 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49892000/jpg/_49892604_49891756.jpg"/>
            </item>
            <item>
              <title>EU 'must improve' cyber defences</title>
              <description>Europe needs to do more to prepare itself for cyber attacks, an EU report concludes after conducting stress tests on networks.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/technology-11726671</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/technology-11726671</guid>
              <pubDate>Wed, 10 Nov 2010 17:31:59 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49880000/jpg/_49880522_000555608-1.jpg"/>
            </item>
            <item>
              <title>Hubble successor's costs balloon</title>
              <description>Nasa's James Webb Space Telescope will cost at least $6.5bn and may still not be ready for launch in 2015, a panel finds.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/science-environment-11731754</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/science-environment-11731754</guid>
              <pubDate>Thu, 11 Nov 2010 00:10:08 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/45725000/jpg/_45725634_mirror7.jpg"/>
            </item>
            <item>
              <title>Rocks record ancient oxygen clues</title>
              <description>Oxygen levels on Earth reached a critical threshold to enable the evolution of complex life earlier than previously thought, say scientists.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/science-environment-11727457</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/science-environment-11727457</guid>
              <pubDate>Wed, 10 Nov 2010 20:15:49 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49882000/jpg/_49882768_rock.jpg"/>
            </item>
            <item>
              <title>Caiman attacks wildlife presenter</title>
              <description>A spectacled caiman attacked wildlife presenter Steve Backshall during filming for the BBC in Argentina.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/earth/hi/earth_news/newsid_9166000/9166924.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/earth/hi/earth_news/newsid_9166000/9166924.stm</guid>
              <pubDate>Thu, 11 Nov 2010 09:23:26 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49876000/jpg/_49876977_caiman.jpg"/>
            </item>
            <item>
              <title>Stones star Wood jokes over award</title>
              <description>Rolling Stones guitarist Ronnie Wood picks up a prize for the band's album Exile on Main Street - even though he did not play on it.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11729822</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11729822</guid>
              <pubDate>Thu, 11 Nov 2010 08:54:52 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889530_010615713-1.jpg"/>
            </item>
            <item>
              <title>Cole and N-Dubz make Variety bill</title>
              <description>Singer Cheryl Cole and pop act N-Dubz are to appear at the Royal Variety Performance in London next month.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11733704</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11733704</guid>
              <pubDate>Thu, 11 Nov 2010 10:33:49 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49891000/jpg/_49891198_cole3.jpg"/>
            </item>
            <item>
              <title>New cause of Brecht death claimed</title>
              <description>German playwright Bertolt Brecht may have died due to an undiagnosed childhood illness, new research claims.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11734035</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11734035</guid>
              <pubDate>Thu, 11 Nov 2010 11:58:35 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49892000/jpg/_49892046_49891092.jpg"/>
            </item>
            <item>
              <title>How the West was won</title>
              <description>China will reclaim its role as the world's leading economy later this century - after a relatively brief interruption by the West.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/magazine-11721671</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/magazine-11721671</guid>
              <pubDate>Wed, 10 Nov 2010 11:42:32 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49874000/jpg/_49874758_china_ukflags66afp.jpg"/>
            </item>
            <item>
              <title>Who grows a moustache nowadays? Err, me</title>
              <description>Thousands of men are sprouting upper-lip hair to raise money for prostate cancer charities. One of them is charting his progress in these pages.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/magazine-11718543</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/magazine-11718543</guid>
              <pubDate>Wed, 10 Nov 2010 13:19:42 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49861000/jpg/_49861382_heery1_304.jpg"/>
            </item>
            <item>
              <title>How to disembark a crowded train</title>
              <description>A new report says train overcrowding is to get worse, so what is the best way to avoid the crush?</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/magazine-11676437</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/magazine-11676437</guid>
              <pubDate>Tue, 09 Nov 2010 13:03:44 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49766000/jpg/_49766825_train.464.jpg"/>
            </item>
            <item>
              <title>EU budgets criticised by audit chief</title>
              <description>The EU has been criticised by the president of the European Court of Auditors in his annual report to Parliament.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/democracylive/hi/europe/newsid_9159000/9159048.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/democracylive/hi/europe/newsid_9159000/9159048.stm</guid>
              <pubDate>Thu, 11 Nov 2010 09:39:03 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49892000/jpg/_49892842_-51.jpg"/>
            </item>
            <item>
              <title>Live: First minister's question time</title>
              <description>Opposition party leaders question Alex Salmond during first minister's questions.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/democracylive/hi/scotland/newsid_8167000/8167433.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/democracylive/hi/scotland/newsid_8167000/8167433.stm</guid>
              <pubDate>Thu, 28 Jan 2010 15:02:58 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/46897000/jpg/_46897140_untitledsequence01.jpg"/>
            </item>
            <item>
              <title>Live: Cancer debate</title>
              <description>Peers are taking part in a debate tabled by Baroness Finlay on the quality and quantity of life of people with cancer.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/democracylive/hi/house_of_lords/newsid_8756000/8756700.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/democracylive/hi/house_of_lords/newsid_8756000/8756700.stm</guid>
              <pubDate>Wed, 23 Jun 2010 14:48:33 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/46647000/jpg/_46647762_-1.jpg"/>
            </item>
            <item>
              <title>Test tube miracles</title>
              <description>25 years of IVF treatment at one of the UK's first dedicated centres</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/health-11442887</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/health-11442887</guid>
              <pubDate>Sat, 16 Oct 2010 23:22:05 GMT</pubDate>
              <media:thumbnail width="3000" height="1800" url="http://news.bbcimg.co.uk/media/images/49316000/jpg/_49316669_care2.jpg"/>
            </item>
            <item>
              <title>China's human rights 'getting worse'</title>
              <description>Activists claim China's human rights situation is getting worse, as Prime Minister David Cameron speaks about democracy and the link with economic progress on his visit to the country.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-asia-pacific-11730827</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-asia-pacific-11730827</guid>
              <pubDate>Thu, 11 Nov 2010 00:32:28 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49887000/jpg/_49887596_jex_864531_de27-1.jpg"/>
            </item>
            <item>
              <title>Panic as tower falls in wrong direction</title>
              <description>The planned demolition of the Ohio Edison tower in Ohio in the US went wrong after a malfunction caused the structure to fall in the wrong direction.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11731636</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11731636</guid>
              <pubDate>Wed, 10 Nov 2010 23:37:35 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888166_tower.jpg"/>
            </item>
            <item>
              <title>Will benefits squeeze get people working?</title>
              <description>The latest phase of the government's controversial plans to reform the benefits system will be unveiled on Thursday. The BBC's Mark Easton reports from Wolverhampton, where seven people are chasing every job vacancy.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-11731634</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-11731634</guid>
              <pubDate>Wed, 10 Nov 2010 23:31:23 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49887000/jpg/_49887955_sam.jpg"/>
            </item>
            <item>
              <title>Pakistan defends Wagah ritual</title>
              <description>Pakistan says it has refused to tone down the decades old border cereomony at the Wagah Border crossing with India.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-south-asia-11727448</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-south-asia-11727448</guid>
              <pubDate>Thu, 11 Nov 2010 06:50:48 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49881000/jpg/_49881359_jex_864028_de27-1.jpg"/>
            </item>
            <item>
              <title>A day of destruction over tuition fees</title>
              <description>Thousands of students have clashed with police at Westminster during a mass demonstration against plans to increase university tuition fees in England.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/uk-11728270</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/uk-11728270</guid>
              <pubDate>Wed, 10 Nov 2010 18:32:14 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49884000/jpg/_49884767_jex_864378_de27-1.jpg"/>
            </item>
            <item>
              <title>Classic rockers on Don't Stop Believin'</title>
              <description>Journey guitarist Neal Schon said Don't Stop Believin' took only a couple of hours to write</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11731995</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11731995</guid>
              <pubDate>Thu, 11 Nov 2010 05:06:50 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49888000/jpg/_49888790_schon.jpg"/>
            </item>
            <item>
              <title>Harrison Ford on presenting Daybreak</title>
              <description>Harrison Ford takes on the role of a breakfast TV presenter, reluctantly working on a struggling show..</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11732474</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11732474</guid>
              <pubDate>Thu, 11 Nov 2010 07:13:02 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49889000/jpg/_49889171_010599991-1.jpg"/>
            </item>
            <item>
              <title>Warner Bros to develop UK film base</title>
              <description>Warner Brothers is to develop Europe's biggest film studio complex at a site near Watford bringing new jobs and investment to Britain.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11731524</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11731524</guid>
              <pubDate>Wed, 10 Nov 2010 23:22:16 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49885000/jpg/_49885899_jex_864535_de20-1.jpg"/>
            </item>
            <item>
              <title>Iain Duncan Smith welfare reform statement</title>
              <description>Live coverage from the House of Commons.</description>
              <link>http://news.bbc.co.uk/go/rss/int/news/-/democracylive/hi/house_of_commons/newsid_8167000/8167404.stm</link>
              <guid isPermaLink="false">http://news.bbc.co.uk/democracylive/hi/house_of_commons/newsid_8167000/8167404.stm</guid>
              <pubDate>Thu, 05 Nov 2009 18:09:37 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/46647000/jpg/_46647743_001073022-1.jpg"/>
            </item>
            <item>
              <title>Soldier X</title>
              <description>The story of how the Unknown Warrior was chosen</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/magazine-11710660</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/magazine-11710660</guid>
              <pubDate>Thu, 11 Nov 2010 02:12:56 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49885000/jpg/_49885579_106665787.jpg"/>
            </item>
            <item>
              <title>Rock and rolls</title>
              <description>Photographer Mick Rock on Blondie, Bowie and Queen</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11722670</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11722670</guid>
              <pubDate>Thu, 11 Nov 2010 08:31:32 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49868000/jpg/_49868392_66-debbieharry1_1978(c)mick.jpg"/>
            </item>
            <item>
              <title>'How much?'</title>
              <description>The euro's high value sends more UK tourists to Eastern Europe.</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11725371</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11725371</guid>
              <pubDate>Thu, 11 Nov 2010 00:15:55 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49878000/jpg/_49878750_beach304.jpg"/>
            </item>
            <item>
              <title>In pictures</title>
              <description>Finalists for prestigious photography prize on show in UK</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/entertainment-arts-11721127</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/entertainment-arts-11721127</guid>
              <pubDate>Thu, 11 Nov 2010 08:48:37 GMT</pubDate>
            </item>
            <item>
              <title>Forrest run</title>
              <description>Marines' 'Gumpathon' across US raises money for injured buddies</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-us-canada-11730522</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-us-canada-11730522</guid>
              <pubDate>Thu, 11 Nov 2010 05:59:18 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49887000/jpg/_49887016_gump.jpg"/>
            </item>
            <item>
              <title>Currency wars</title>
              <description>BBC correspondents give the global perspective</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/business-11710202</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/business-11710202</guid>
              <pubDate>Tue, 09 Nov 2010 14:43:35 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49874000/jpg/_49874032_49872973.jpg"/>
            </item>
            <item>
              <title>Your pictures</title>
              <description>Readers' pictures on the theme of Bonfire Night</description>
              <link>http://www.bbc.co.uk/go/rss/int/news/-/news/world-11725171</link>
              <guid isPermaLink="false">http://www.bbc.co.uk/news/world-11725171</guid>
              <pubDate>Thu, 11 Nov 2010 09:14:40 GMT</pubDate>
              <media:thumbnail width="66" height="49" url="http://news.bbcimg.co.uk/media/images/49873000/jpg/_49873467_49872634.jpg"/>
            </item>
          </channel>
        </rss>
      feed
    end

  end
end

