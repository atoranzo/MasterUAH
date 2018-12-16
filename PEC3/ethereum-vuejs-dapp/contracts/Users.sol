pragma solidity ^0.4.21;



contract Users {
    // data structure that stores a user
    struct User {
        string name;
        bytes32 status;
        string education;
        string phone;
        string competences;
        string projects;
        address walletAddress;
        uint createdAt;
        uint updatedAt;
    }

    // it maps the user's wallet address with the user ID
    mapping (address => uint) public usersIds;

    // Array of User that holds the list of users and their details
    User[] public users;

    // event fired when an user is registered
    event newUserRegistered(uint id);

    // event fired when the user updates his status or name
    event userUpdateEvent(uint id);



    // Modifier: check if the caller of the smart contract is registered
    modifier checkSenderIsRegistered {
    	require(isRegistered());
    	_;
    }



    /**
     * Constructor function
     */
    constructor() public
    {
        // NOTE: the first user MUST be emtpy
        addUser(0x0, "", "", "", "", "", "");

        // Some dummy data
        addUser(0x333333333333, "Luis Gomez", "en paro", "BUP", "6666666", "Dance", "ECI");
        addUser(0x111111111111, "Juan García", "trabajando", "FP II sistemas informaticos", "5555555", "SAP", "Airbus");
        addUser(0x222222222222, "Maria Lopez", "en paro", "informatica de sistemas", "4444444", "solidity", "poli");
    }



    /**
     * Function to register a new user.
     *
     * @param _userName 		The displaying name
     * @param _status        The status of the user
     * @param _education     The education of the user
     * @param _phone         the phone of the user
     * @param _competences   the competences of the user
     * @param _projects      the projects of the user
     */
    function registerUser(string _userName, bytes32 _status, string _education, string _phone, string _competences, string _projects) public
    returns(uint)
    {
    	return addUser(msg.sender, _userName, _status, _education, _phone, _competences, _projects);
    }



    /**
     * Add a new user. This function must be private because an user
     * cannot insert another user on behalf of someone else.
     *
     * @param _wAddr 		Address wallet of the user
     * @param _userName		Displaying name of the user
     * @param _status    	Status of the user
     * @param _education  	education of the user
     * @param _phone        phone of the user
     * @param _competences  competences of the user
     * @param _projects     projects of the user
     */
    function addUser(address _wAddr, string _userName, bytes32 _status, string _education, string _phone, string _competences, string _projects) private
    returns(uint)
    {
        // checking if the user is already registered
        uint userId = usersIds[_wAddr];
        require (userId == 0);

        // associating the user wallet address with the new ID
        usersIds[_wAddr] = users.length;
        uint newUserId = users.length++;

        // storing the new user details
        users[newUserId] = User({
        	name: _userName,
        	status: _status,
            education: _education,
            phone: _phone,
            competences: _competences,
            projects: _projects,
        	walletAddress: _wAddr,
        	createdAt: now,
        	updatedAt: now
        });

        // emitting the event that a new user has been registered
        emit newUserRegistered(newUserId);

        return newUserId;
    }



    /**
     * Update the user profile of the caller of this method.
     * Note: the user can modify only his own profile.
     *
     * @param _newUserName	The new user's displaying name
     * @param _newStatus 	The new user's status
     * @param _newEducation The new user's education
     * @param _newPhone     the new user's phone
     * @param _newCompetences the new user's competences
     * @param _newProjects the new user's projects
     */
    function updateUser(string _newUserName, bytes32 _newStatus, string _newEducation, string _newPhone, string _newCompetences, string _newProjects) checkSenderIsRegistered public
    returns(uint)
    {
    	// An user can modify only his own profile.
    	uint userId = usersIds[msg.sender];

    	User storage user = users[userId];

    	user.name = _newUserName;
    	user.status = _newStatus;
        user.education = _newEducation;
        user.phone = _newPhone;
        user.competences = _newCompetences;
        user.projects = _newProjects;
    	user.updatedAt = now;

    	emit userUpdateEvent(userId);

    	return userId;
    }



    /**
     * Get the user's profile information.
     *
     * @param _id 	The ID of the user stored on the blockchain.
     */
    function getUserById(uint _id) public view
    returns(
    	uint,
    	string,
    	bytes32,
        string,
        string,
        string,
        string,
    	address,
    	uint,
    	uint
    ) {
    	// checking if the ID is valid
    	require( (_id > 0) || (_id <= users.length) );

    	User memory i = users[_id];

    	return (
    		_id,
    		i.name,
    		i.status,
            i.education,
            i.phone,
            i.competences,
            i.projects,
    		i.walletAddress,
    		i.createdAt,
    		i.updatedAt
    	);
    }



    /**
     * Return the profile information of the caller.
     */
    function getOwnProfile() checkSenderIsRegistered public view
    returns(
    	uint,
    	string,
    	bytes32,
        string,
        string,
        string,
        string,
    	address,
    	uint,
    	uint
    ) {
    	uint id = usersIds[msg.sender];

    	return getUserById(id);
    }



    /**
     * Check if the user that is calling the smart contract is registered.
     */
    function isRegistered() public view returns (bool)
    {
    	return (usersIds[msg.sender] != 0);
    }



    /**
     * Return the number of total registered users.
     */
    function totalUsers() public view returns (uint)
    {
        return users.length - 1;
    }

}
