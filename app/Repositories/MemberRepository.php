<?php

namespace App\Repositories;

use App\Models\Member;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class VirtualRepository
 * @package App\Repositories
 * @version August 15, 2018, 2:17 pm UTC
 *
 * @method Virtual findWithoutFail($id, $columns = ['*'])
 * @method Virtual find($id, $columns = ['*'])
 * @method Virtual first($columns = ['*'])
*/
class MemberRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'pelanggan_id',
        'user_id',
        'name',
        'status'
        
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Member::class;
    }
}
