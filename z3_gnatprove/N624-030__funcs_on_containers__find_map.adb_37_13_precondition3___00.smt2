(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort hash_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 32))

(declare-fun user_eq1 (hash_type hash_type) Bool)

(declare-const dummy1 hash_type)

(declare-datatypes ()
((hash_type__ref (hash_type__refqtmk (hash_type__content hash_type)))))
(define-fun hash_type__ref_hash_type__content__projection ((a hash_type__ref)) hash_type 
  (hash_type__content a))

(declare-fun to_rep1 (hash_type) (_ BitVec 32))

(declare-fun of_rep1 ((_ BitVec 32)) hash_type)

;; inversion_axiom
  (assert
  (forall ((x hash_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x hash_type)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x hash_type)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (count_type count_type) Bool)

(declare-const dummy2 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep2 ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep2 (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range2
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__find_map__index_maps__map__capacity count_type)(rec__find_map__index_maps__map__modulus hash_type)))))
(define-fun us_split_discrs_rec__find_map__index_maps__map__capacity__projection ((a us_split_discrs)) count_type 
  (rec__find_map__index_maps__map__capacity a))

(define-fun us_split_discrs_rec__find_map__index_maps__map__modulus__projection ((a us_split_discrs)) hash_type 
  (rec__find_map__index_maps__map__modulus a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__find_map__index_maps__map us_main_type)))))
(define-fun us_split_fields_rec__find_map__index_maps__map__projection ((a us_split_fields)) us_main_type 
  (rec__find_map__index_maps__map a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep2
                           (rec__find_map__index_maps__map__capacity
                           (us_split_discrs1 a))) (to_rep2
                                                  (rec__find_map__index_maps__map__capacity
                                                  (us_split_discrs1 b))))
                        (= (to_rep1
                           (rec__find_map__index_maps__map__modulus
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__find_map__index_maps__map__modulus
                                                  (us_split_discrs1 b)))))
                        (= (us_main_eq
                           (rec__find_map__index_maps__map
                           (us_split_fields1 a))
                           (rec__find_map__index_maps__map
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__find_map__index_maps__map__capacity1 Int)
  (rec__find_map__index_maps__map__modulus1 (_ BitVec 32))
  (a us_split_discrs)) Bool (and
                            (= rec__find_map__index_maps__map__capacity1 
                            (to_rep2
                            (rec__find_map__index_maps__map__capacity a)))
                            (= rec__find_map__index_maps__map__modulus1 
                            (to_rep1
                            (rec__find_map__index_maps__map__modulus a)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const find_map__index_maps__map__capacity__first__bit Int)

(declare-const find_map__index_maps__map__capacity__last__bit Int)

(declare-const find_map__index_maps__map__capacity__position Int)

;; find_map__index_maps__map__capacity__first__bit_axiom
  (assert (<= 0 find_map__index_maps__map__capacity__first__bit))

;; find_map__index_maps__map__capacity__last__bit_axiom
  (assert
  (< find_map__index_maps__map__capacity__first__bit find_map__index_maps__map__capacity__last__bit))

;; find_map__index_maps__map__capacity__position_axiom
  (assert (<= 0 find_map__index_maps__map__capacity__position))

(declare-const find_map__index_maps__map__modulus__first__bit Int)

(declare-const find_map__index_maps__map__modulus__last__bit Int)

(declare-const find_map__index_maps__map__modulus__position Int)

;; find_map__index_maps__map__modulus__first__bit_axiom
  (assert (<= 0 find_map__index_maps__map__modulus__first__bit))

;; find_map__index_maps__map__modulus__last__bit_axiom
  (assert
  (< find_map__index_maps__map__modulus__first__bit find_map__index_maps__map__modulus__last__bit))

;; find_map__index_maps__map__modulus__position_axiom
  (assert (<= 0 find_map__index_maps__map__modulus__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((map__ref (map__refqtmk (map__content us_rep)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep (map__content
                                                                    a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes () ((map__ref1 (map__refqtmk1 (map__content1 us_rep1)))))
(define-fun map__ref_map__content__2__projection ((a map__ref1)) us_rep1 
  (map__content1 a))

(declare-fun has_key (us_rep1 Int) Bool)

(declare-fun has_key__function_guard (Bool us_rep1 Int) Bool)

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(define-fun contains ((container us_rep)
  (key Int)) Bool (has_key (model1 container) key))

(declare-fun contains__function_guard (Bool us_rep Int) Bool)

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(define-fun element ((container us_rep)
  (key Int)) Int (get (model1 container) key))

(declare-fun element__function_guard (Int us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_280 Int)
  (temp___is_init_276 Bool) (temp___skip_constant_277 Bool)
  (temp___do_toplevel_278 Bool)
  (temp___do_typ_inv_279 Bool)) Bool (=>
                                     (or (= temp___is_init_276 true)
                                     (<= 1 100)) (in_range4 temp___expr_280)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep3 ((x integer)) Int (integerqtint x))

(declare-fun of_rep3 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range5 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (index index) Bool)

(declare-const dummy7 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ()
((map__ref2 (map__refqtmk2 (map__content2 (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range5 f)
     (=> (in_range5 l)
     (and (= (to_rep3 (first (mk f l))) f) (= (to_rep3 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range5 low)
                   (and (in_range5 high)
                   (=> (<= low high) (and (in_range6 low) (in_range6 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep3 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep3 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq2 (elts x) (to_rep3 (first (rt x)))
                 (to_rep3 (last (rt x))) (elts y) (to_rep3 (first (rt y)))
                 (to_rep3 (last (rt y)))))

(declare-fun user_eq8 (us_t us_t) Bool)

(declare-const dummy8 us_t)

(declare-datatypes ()
((nat_array__ref (nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const last2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(declare-const r252s (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const find_map__index_maps__map__capacity__first__bit1 Int)

(declare-const find_map__index_maps__map__capacity__last__bit1 Int)

(declare-const find_map__index_maps__map__capacity__position1 Int)

;; find_map__index_maps__map__capacity__first__bit_axiom
  (assert (<= 0 find_map__index_maps__map__capacity__first__bit1))

;; find_map__index_maps__map__capacity__last__bit_axiom
  (assert
  (< find_map__index_maps__map__capacity__first__bit1 find_map__index_maps__map__capacity__last__bit1))

;; find_map__index_maps__map__capacity__position_axiom
  (assert (<= 0 find_map__index_maps__map__capacity__position1))

(declare-const find_map__index_maps__map__modulus__first__bit1 Int)

(declare-const find_map__index_maps__map__modulus__last__bit1 Int)

(declare-const find_map__index_maps__map__modulus__position1 Int)

;; find_map__index_maps__map__modulus__first__bit_axiom
  (assert (<= 0 find_map__index_maps__map__modulus__first__bit1))

;; find_map__index_maps__map__modulus__last__bit_axiom
  (assert
  (< find_map__index_maps__map__modulus__first__bit1 find_map__index_maps__map__modulus__last__bit1))

;; find_map__index_maps__map__modulus__position_axiom
  (assert (<= 0 find_map__index_maps__map__modulus__position1))

(declare-fun user_eq9 (us_rep us_rep) Bool)

(declare-const dummy9 us_rep)

(declare-datatypes ()
((index_map__ref (index_map__refqtmk (index_map__content us_rep)))))
(define-fun index_map__ref_index_map__content__projection ((a1 index_map__ref)) us_rep 
  (index_map__content a1))

;; user_eq__def_axiom
  (assert
  (forall ((a1 us_rep) (b us_rep))
  (! (= (user_eq9 a1 b) (oeq a1 b)) :pattern ((user_eq9 a1 b)) )))

(define-fun dynamic_invariant2 ((temp___expr_632 us_rep)
  (temp___is_init_628 Bool) (temp___skip_constant_629 Bool)
  (temp___do_toplevel_630 Bool)
  (temp___do_typ_inv_631 Bool)) Bool (=>
                                     (not (= temp___skip_constant_629 true))
                                     (in_range3 100 r252s
                                     (us_split_discrs1 temp___expr_632))))

(define-fun default_initial_assumption ((temp___expr_635 us_rep)
  (temp___skip_top_level_636 Bool)) Bool (and
                                         (and
                                         (= (to_rep2
                                            (rec__find_map__index_maps__map__capacity
                                            (us_split_discrs1
                                            temp___expr_635))) 100)
                                         (= (to_rep1
                                            (rec__find_map__index_maps__map__modulus
                                            (us_split_discrs1
                                            temp___expr_635))) r252s))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_636 true))
                                         (= (is_empty temp___expr_635) true))))

(declare-const m us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant3 ((temp___expr_253 Int)
  (temp___is_init_249 Bool) (temp___skip_constant_250 Bool)
  (temp___do_toplevel_251 Bool)
  (temp___do_typ_inv_252 Bool)) Bool (=>
                                     (or (= temp___is_init_249 true)
                                     (<= 1 100)) (in_range6 temp___expr_253)))

(define-fun dynamic_invariant4 ((temp___expr_260 us_t)
  (temp___is_init_256 Bool) (temp___skip_constant_257 Bool)
  (temp___do_toplevel_258 Bool)
  (temp___do_typ_inv_259 Bool)) Bool (=>
                                     (not (= temp___skip_constant_257 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_260)
                                     (last1 temp___expr_260))))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range5 temp___expr_18)))

(declare-fun equivalent_keys (Int Int) Bool)

(declare-fun equivalent_keys__function_guard (Bool Int Int) Bool)

;; equivalent_keys__post_axiom
  (assert true)

;; equivalent_keys__def_axiom
  (assert
  (forall ((e1 Int) (e2 Int))
  (! (= (= (equivalent_keys e1 e2) true) (= e1 e2)) :pattern ((equivalent_keys
                                                              e1 e2)) )))

(define-fun dynamic_invariant6 ((temp___expr_266 (_ BitVec 32))
  (temp___is_init_262 Bool) (temp___skip_constant_263 Bool)
  (temp___do_toplevel_264 Bool) (temp___do_typ_inv_265 Bool)) Bool true)

(define-fun dynamic_invariant7 ((temp___expr_287 Int)
  (temp___is_init_283 Bool) (temp___skip_constant_284 Bool)
  (temp___do_toplevel_285 Bool)
  (temp___do_typ_inv_286 Bool)) Bool (=>
                                     (or (= temp___is_init_283 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_287)))

;; user_eq__def_axiom
  (assert
  (forall ((a1 us_rep) (b us_rep))
  (! (= (user_eq3 a1 b) (oeq a1 b)) :pattern ((user_eq3 a1 b)) )))

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length1 container)))
     (and
     (<= result (to_rep2
                (rec__find_map__index_maps__map__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant7 result true false true true))) :pattern ((length1
                                                                  container)) )))

(declare-fun length2 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(declare-fun oeq1 (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

(declare-fun is_empty1 (us_rep1) Bool)

(declare-fun is_empty__function_guard1 (Bool us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a1 us_rep1) (b us_rep1))
  (! (= (user_eq4 a1 b) (oeq1 a1 b)) :pattern ((user_eq4 a1 b)) )))

(define-fun default_initial_assumption1 ((temp___expr_335 us_rep1)
  (temp___skip_top_level_336 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_336 true))
                                         (and
                                         (= (is_empty1 temp___expr_335) true)
                                         (= (length2 temp___expr_335) 0))))

;; model__post_axiom
  (assert true)

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (= (is_empty container) true) (= (length1 container) 0)) :pattern (
  (is_empty container)) )))

(declare-fun default_modulus (Int) (_ BitVec 32))

(declare-fun default_modulus__function_guard ((_ BitVec 32) Int) Bool)

;; default_modulus__post_axiom
  (assert
  (forall ((capacity Int))
  (! (=> (dynamic_invariant7 capacity true true true true)
     (dynamic_invariant6 (default_modulus capacity) true false true true)) :pattern (
  (default_modulus capacity)) )))

(declare-sort key_type 0)

(declare-fun key_typeqtint (key_type) Int)

;; key_type'axiom
  (assert
  (forall ((i key_type))
  (and (<= 0 (key_typeqtint i)) (<= (key_typeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (key_type key_type) Bool)

(declare-const dummy10 key_type)

(declare-datatypes ()
((key_type__ref (key_type__refqtmk (key_type__content key_type)))))
(define-fun key_type__ref_key_type__content__2__projection ((a1 key_type__ref)) key_type 
  (key_type__content a1))

(define-fun dynamic_invariant8 ((temp___expr_320 Int)
  (temp___is_init_316 Bool) (temp___skip_constant_317 Bool)
  (temp___do_toplevel_318 Bool)
  (temp___do_typ_inv_319 Bool)) Bool (=>
                                     (or (= temp___is_init_316 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_320)))

;; has_key__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((key Int))
  (! (=> (dynamic_invariant8 key true true true true)
     (and
     (forall ((key1 Int) (k Int)) (equivalent_keys__function_guard
     (equivalent_keys k key1) k key1))
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((k Int))
     (and (and (in_range7 k) (= (has_key container k) true))
     (= (equivalent_keys k key) true))) (= (has_key container key) true))))) :pattern (
  (has_key container key)) ))))

(declare-fun witness (us_rep1 Int) Int)

(declare-fun witness__function_guard (Int us_rep1 Int) Bool)

(declare-fun w_get (us_rep1 Int) Int)

(declare-fun w_get__function_guard (Int us_rep1 Int) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq11 (element_type1 element_type1) Bool)

(declare-const dummy11 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a1 element_type__ref1)) element_type1 
  (element_type__content1 a1))

(define-fun dynamic_invariant9 ((temp___expr_327 Int)
  (temp___is_init_323 Bool) (temp___skip_constant_324 Bool)
  (temp___do_toplevel_325 Bool)
  (temp___do_typ_inv_326 Bool)) Bool (=>
                                     (or (= temp___is_init_323 true)
                                     (<= 1 100)) (in_range8 temp___expr_327)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((key Int))
  (! (=>
     (and (dynamic_invariant8 key true true true true)
     (= (has_key container key) true))
     (let ((result (get container key)))
     (and
     (and
     (forall ((key1 Int) (k Int)) (equivalent_keys__function_guard
     (equivalent_keys k key1) k key1))
     (=> (= (distinct 1 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k Int))
     (=> (and (in_range7 k) (= (has_key container k) true))
     (= (= (equivalent_keys k key) true)
     (= (witness container key) (witness container k))))))))
     (dynamic_invariant9 result true false true true)))) :pattern ((get
                                                                   container
                                                                   key)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep1)) (! (dynamic_invariant7 (length2 container)
  true false true true) :pattern ((length2 container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (oeq1 left right) true)
     (and
     (forall ((key Int))
     (=> (and (in_range7 key) (= (has_key left key) true))
     (and (= (has_key right key) true) (= (get right key) (get left key)))))
     (forall ((key Int))
     (=> (and (in_range7 key) (= (has_key right key) true))
     (= (has_key left key) true))))) :pattern ((oeq1 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (= (= (is_empty1 container) true)
     (forall ((key Int))
     (not (and (in_range7 key) (= (has_key container key) true))))) :pattern (
  (is_empty1 container)) )))

(declare-fun has_witness (us_rep1 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep1 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((key Int))
  (! (=>
     (and (dynamic_invariant8 key true true true true)
     (= (has_key container key) true))
     (let ((result (witness container key)))
     (and (= (has_witness container result) true) (dynamic_invariant7 result
     true false true true)))) :pattern ((witness container key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant7 witness1 true true true true)
     (= (has_witness container witness1) true)) (dynamic_invariant9
     (w_get container witness1) true false true true)) :pattern ((w_get
                                                                 container
                                                                 witness1)) ))))

;; r252s__def_axiom
  (assert (= r252s (default_modulus 100)))

;; Assume
  (assert (dynamic_invariant4 a true false true true))

;; Assume
  (assert (dynamic_invariant e true false true true))

;; Assume
  (assert (dynamic_invariant3 last2 true false true true))

;; Assume
  (assert (dynamic_invariant2 m true false true true))

;; Assume
  (assert (dynamic_invariant4 a true false true true))

;; Assume
  (assert (dynamic_invariant e true false true true))

;; Assume
  (assert (dynamic_invariant3 last2 true false true true))

;; Assume
  (assert
  (and
  (and
  (and (< 0 (length a))
  (=> (= (contains m e) true)
  (let ((temp___886 (element m e)))
  (and (<= (first1 a) temp___886) (<= temp___886 (last1 a))))))
  (forall ((i Int))
  (=> (and (<= (first1 a) i) (<= i (- (element m e) 1)))
  (not (= (to_rep (select (to_array a) i)) e))))) (= (contains m e) true)))

(define-fun o () Int e)

(define-fun o1 () us_rep m)

(assert
;; defqtvc
 ;; File "find_map.adb", line 36, characters 0-0
  (not (= (contains o1 o) true)))
(check-sat)
