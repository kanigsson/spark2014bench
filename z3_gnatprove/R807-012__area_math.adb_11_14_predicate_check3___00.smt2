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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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

(declare-sort address_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 32))

(declare-fun user_eq2 (address_type address_type) Bool)

(declare-const dummy2 address_type)

(declare-datatypes ()
((address_type__ref
 (address_type__refqtmk (address_type__content address_type)))))
(define-fun address_type__ref_address_type__content__projection ((a address_type__ref)) address_type 
  (address_type__content a))

(declare-fun to_rep2 (address_type) (_ BitVec 32))

(declare-fun of_rep2 ((_ BitVec 32)) address_type)

;; inversion_axiom
  (assert
  (forall ((x address_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(define-fun to_int2 ((x address_type)) Int (bv2int (to_rep2 x)))

;; range_int_axiom
  (assert
  (forall ((x address_type)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int address_type))))))
(declare-fun slide ((Array Int address_type) Int
  Int) (Array Int address_type))

;; slide_eq
  (assert
  (forall ((a (Array Int address_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int address_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int address_type)) (a__first Int)
  (a__last Int) (b (Array Int address_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int address_type)) (b (Array Int address_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
((us_t (us_tqtmk (elts (Array Int address_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int address_type) (elts a))

(define-fun of_array ((a (Array Int address_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((area_array__ref (area_array__refqtmk (area_array__content us_t)))))
(define-fun area_array__ref_area_array__content__projection ((a area_array__ref)) us_t 
  (area_array__content a))

(declare-datatypes () ((t6s__ref (t6s__refqtmk (t6s__content us_t)))))
(define-fun t6s__ref_t6s__content__projection ((a t6s__ref)) us_t (t6s__content
                                                                  a))

(declare-datatypes () ((t8s__ref (t8s__refqtmk (t8s__content us_t)))))
(define-fun t8s__ref_t8s__content__projection ((a t8s__ref)) us_t (t8s__content
                                                                  a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__area_math__ensemble__max natural)))))
(define-fun us_split_discrs_rec__area_math__ensemble__max__projection ((a us_split_discrs)) natural 
  (rec__area_math__ensemble__max a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__area_math__ensemble__size natural)(rec__area_math__ensemble__from us_t)(rec__area_math__ensemble__to us_t)))))
(define-fun us_split_fields_rec__area_math__ensemble__size__projection ((a us_split_fields)) natural 
  (rec__area_math__ensemble__size a))

(define-fun us_split_fields_rec__area_math__ensemble__from__projection ((a us_split_fields)) us_t 
  (rec__area_math__ensemble__from a))

(define-fun us_split_fields_rec__area_math__ensemble__to__projection ((a us_split_fields)) us_t 
  (rec__area_math__ensemble__to a))

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

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__area_math__ensemble__max
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__area_math__ensemble__max
                                                  (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__area_math__ensemble__size
                           (us_split_fields1 a))) (to_rep
                                                  (rec__area_math__ensemble__size
                                                  (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__area_math__ensemble__from
                           (us_split_fields1 a))
                           (rec__area_math__ensemble__from
                           (us_split_fields1 b))) true))
                        (= (bool_eq1
                           (rec__area_math__ensemble__to
                           (us_split_fields1 a))
                           (rec__area_math__ensemble__to
                           (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range2 ((rec__area_math__ensemble__max1 Int)
  (a us_split_discrs)) Bool (= rec__area_math__ensemble__max1 (to_rep
                                                              (rec__area_math__ensemble__max
                                                              a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const area_math__ensemble__max__first__bit Int)

(declare-const area_math__ensemble__max__last__bit Int)

(declare-const area_math__ensemble__max__position Int)

;; area_math__ensemble__max__first__bit_axiom
  (assert (<= 0 area_math__ensemble__max__first__bit))

;; area_math__ensemble__max__last__bit_axiom
  (assert
  (< area_math__ensemble__max__first__bit area_math__ensemble__max__last__bit))

;; area_math__ensemble__max__position_axiom
  (assert (<= 0 area_math__ensemble__max__position))

(declare-const area_math__ensemble__size__first__bit Int)

(declare-const area_math__ensemble__size__last__bit Int)

(declare-const area_math__ensemble__size__position Int)

;; area_math__ensemble__size__first__bit_axiom
  (assert (<= 0 area_math__ensemble__size__first__bit))

;; area_math__ensemble__size__last__bit_axiom
  (assert
  (< area_math__ensemble__size__first__bit area_math__ensemble__size__last__bit))

;; area_math__ensemble__size__position_axiom
  (assert (<= 0 area_math__ensemble__size__position))

(declare-const area_math__ensemble__from__first__bit Int)

(declare-const area_math__ensemble__from__last__bit Int)

(declare-const area_math__ensemble__from__position Int)

;; area_math__ensemble__from__first__bit_axiom
  (assert (<= 0 area_math__ensemble__from__first__bit))

;; area_math__ensemble__from__last__bit_axiom
  (assert
  (< area_math__ensemble__from__first__bit area_math__ensemble__from__last__bit))

;; area_math__ensemble__from__position_axiom
  (assert (<= 0 area_math__ensemble__from__position))

(declare-const area_math__ensemble__to__first__bit Int)

(declare-const area_math__ensemble__to__last__bit Int)

(declare-const area_math__ensemble__to__position Int)

;; area_math__ensemble__to__first__bit_axiom
  (assert (<= 0 area_math__ensemble__to__first__bit))

;; area_math__ensemble__to__last__bit_axiom
  (assert
  (< area_math__ensemble__to__first__bit area_math__ensemble__to__last__bit))

;; area_math__ensemble__to__position_axiom
  (assert (<= 0 area_math__ensemble__to__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((ensemble__ref (ensemble__refqtmk (ensemble__content us_rep)))))
(define-fun ensemble__ref_ensemble__content__projection ((a ensemble__ref)) us_rep 
  (ensemble__content a))

(declare-const from (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const to__ (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_183 (_ BitVec 32))
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool) (temp___do_typ_inv_182 Bool)) Bool true)

(declare-sort tT3bP1 0)

(declare-fun tT3bP1qtint (tT3bP1) Int)

;; tT3bP1'axiom
  (assert
  (forall ((i tT3bP1)) (and (<= 1 (tT3bP1qtint i)) (<= (tT3bP1qtint i) 1))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (tT3bP1 tT3bP1) Bool)

(declare-const dummy5 tT3bP1)

(declare-datatypes ()
((tT3bP1__ref (tT3bP1__refqtmk (tT3bP1__content tT3bP1)))))
(define-fun tT3bP1__ref_tT3bP1__content__projection ((a tT3bP1__ref)) tT3bP1 
  (tT3bP1__content a))

(declare-const dummy6 (Array Int address_type))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq6 ((Array Int address_type)
  (Array Int address_type)) Bool)

(declare-sort tT4bP1 0)

(declare-fun tT4bP1qtint (tT4bP1) Int)

;; tT4bP1'axiom
  (assert
  (forall ((i tT4bP1)) (and (<= 1 (tT4bP1qtint i)) (<= (tT4bP1qtint i) 1))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (tT4bP1 tT4bP1) Bool)

(declare-const dummy7 tT4bP1)

(declare-datatypes ()
((tT4bP1__ref (tT4bP1__refqtmk (tT4bP1__content tT4bP1)))))
(define-fun tT4bP1__ref_tT4bP1__content__projection ((a tT4bP1__ref)) tT4bP1 
  (tT4bP1__content a))

(declare-const dummy8 (Array Int address_type))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq8 ((Array Int address_type)
  (Array Int address_type)) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__area_math__ensemble__size1 natural)(rec__area_math__ensemble__from1 (Array Int address_type))(rec__area_math__ensemble__to1 (Array Int address_type))))))
(define-fun us_split_fields_rec__area_math__ensemble__size__3__projection ((a us_split_fields2)) natural 
  (rec__area_math__ensemble__size1 a))

(define-fun us_split_fields_rec__area_math__ensemble__from__3__projection ((a us_split_fields2)) (Array Int address_type) 
  (rec__area_math__ensemble__from1 a))

(define-fun us_split_fields_rec__area_math__ensemble__to__3__projection ((a us_split_fields2)) (Array Int address_type) 
  (rec__area_math__ensemble__to1 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__area_math__ensemble__size1
                                         (us_split_fields3 a))
                                         (of_array
                                         (rec__area_math__ensemble__from1
                                         (us_split_fields3 a)) 1 1)
                                         (of_array
                                         (rec__area_math__ensemble__to1
                                         (us_split_fields3 a)) 1 1))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__area_math__ensemble__size
                                         (us_split_fields1 r))
                                         (let ((temp___169 (rec__area_math__ensemble__from
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___169))
                                         (let ((temp___170 (rec__area_math__ensemble__to
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___170)))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__area_math__ensemble__max
                            (us_split_discrs2 a))) (to_rep
                                                   (rec__area_math__ensemble__max
                                                   (us_split_discrs2 b))))
                         (and
                         (and
                         (= (to_rep
                            (rec__area_math__ensemble__size1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__area_math__ensemble__size1
                                                   (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__area_math__ensemble__from1
                            (us_split_fields3 a)) 1 1
                            (rec__area_math__ensemble__from1
                            (us_split_fields3 b)) 1 1) true))
                         (= (bool_eq
                            (rec__area_math__ensemble__to1
                            (us_split_fields3 a)) 1 1
                            (rec__area_math__ensemble__to1
                            (us_split_fields3 b)) 1 1) true)))
                    true false))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const area_math__ensemble__max__first__bit1 Int)

(declare-const area_math__ensemble__max__last__bit1 Int)

(declare-const area_math__ensemble__max__position1 Int)

;; area_math__ensemble__max__first__bit_axiom
  (assert (<= 0 area_math__ensemble__max__first__bit1))

;; area_math__ensemble__max__last__bit_axiom
  (assert
  (< area_math__ensemble__max__first__bit1 area_math__ensemble__max__last__bit1))

;; area_math__ensemble__max__position_axiom
  (assert (<= 0 area_math__ensemble__max__position1))

(declare-const area_math__ensemble__size__first__bit1 Int)

(declare-const area_math__ensemble__size__last__bit1 Int)

(declare-const area_math__ensemble__size__position1 Int)

;; area_math__ensemble__size__first__bit_axiom
  (assert (<= 0 area_math__ensemble__size__first__bit1))

;; area_math__ensemble__size__last__bit_axiom
  (assert
  (< area_math__ensemble__size__first__bit1 area_math__ensemble__size__last__bit1))

;; area_math__ensemble__size__position_axiom
  (assert (<= 0 area_math__ensemble__size__position1))

(declare-const area_math__ensemble__from__first__bit1 Int)

(declare-const area_math__ensemble__from__last__bit1 Int)

(declare-const area_math__ensemble__from__position1 Int)

;; area_math__ensemble__from__first__bit_axiom
  (assert (<= 0 area_math__ensemble__from__first__bit1))

;; area_math__ensemble__from__last__bit_axiom
  (assert
  (< area_math__ensemble__from__first__bit1 area_math__ensemble__from__last__bit1))

;; area_math__ensemble__from__position_axiom
  (assert (<= 0 area_math__ensemble__from__position1))

(declare-const area_math__ensemble__to__first__bit1 Int)

(declare-const area_math__ensemble__to__last__bit1 Int)

(declare-const area_math__ensemble__to__position1 Int)

;; area_math__ensemble__to__first__bit_axiom
  (assert (<= 0 area_math__ensemble__to__first__bit1))

;; area_math__ensemble__to__last__bit_axiom
  (assert
  (< area_math__ensemble__to__first__bit1 area_math__ensemble__to__last__bit1))

;; area_math__ensemble__to__position_axiom
  (assert (<= 0 area_math__ensemble__to__position1))

(declare-fun user_eq9 (us_rep1 us_rep1) Bool)

(declare-const dummy9 us_rep1)

(declare-datatypes () ((t2b__ref (t2b__refqtmk (t2b__content us_rep1)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep1 
  (t2b__content a))

(define-fun dynamic_predicate ((temp___309 us_rep1)) Bool (and
                                                          (<= (to_rep
                                                              (rec__area_math__ensemble__size
                                                              (us_split_fields1
                                                              (to_base
                                                              temp___309)))) 
                                                          (last1
                                                          (rec__area_math__ensemble__from
                                                          (us_split_fields1
                                                          (to_base
                                                          temp___309)))))
                                                          (<= (to_rep
                                                              (rec__area_math__ensemble__size
                                                              (us_split_fields1
                                                              (to_base
                                                              temp___309)))) 
                                                          (last1
                                                          (rec__area_math__ensemble__to
                                                          (us_split_fields1
                                                          (to_base
                                                          temp___309)))))))

(declare-fun temp_____aggregate_def_381 ((_ BitVec 32)) (Array Int address_type))

(declare-fun temp_____aggregate_def_385 ((_ BitVec 32)) (Array Int address_type))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_206 us_rep)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_204 true)
                                     (=> (= temp___is_init_202 true)
                                     (and
                                     (<= (to_rep
                                         (rec__area_math__ensemble__size
                                         (us_split_fields1 temp___expr_206))) 
                                     (last1
                                     (rec__area_math__ensemble__from
                                     (us_split_fields1 temp___expr_206))))
                                     (<= (to_rep
                                         (rec__area_math__ensemble__size
                                         (us_split_fields1 temp___expr_206))) 
                                     (last1
                                     (rec__area_math__ensemble__to
                                     (us_split_fields1 temp___expr_206)))))))
                                     (let ((temp___208 (rec__area_math__ensemble__max
                                                       (us_split_discrs1
                                                       temp___expr_206))))
                                     (and
                                     (and (dynamic_property 1
                                     (to_rep temp___208)
                                     (first1
                                     (rec__area_math__ensemble__from
                                     (us_split_fields1 temp___expr_206)))
                                     (last1
                                     (rec__area_math__ensemble__from
                                     (us_split_fields1 temp___expr_206))))
                                     (and
                                     (= (first1
                                        (rec__area_math__ensemble__from
                                        (us_split_fields1 temp___expr_206))) 1)
                                     (= (last1
                                        (rec__area_math__ensemble__from
                                        (us_split_fields1 temp___expr_206))) 
                                     (to_rep temp___208))))
                                     (and (dynamic_property 1
                                     (to_rep temp___208)
                                     (first1
                                     (rec__area_math__ensemble__to
                                     (us_split_fields1 temp___expr_206)))
                                     (last1
                                     (rec__area_math__ensemble__to
                                     (us_split_fields1 temp___expr_206))))
                                     (and
                                     (= (first1
                                        (rec__area_math__ensemble__to
                                        (us_split_fields1 temp___expr_206))) 1)
                                     (= (last1
                                        (rec__area_math__ensemble__to
                                        (us_split_fields1 temp___expr_206))) 
                                     (to_rep temp___208))))))))

(define-fun dynamic_predicate1 ((temp___211 us_rep)) Bool (and
                                                          (<= (to_rep
                                                              (rec__area_math__ensemble__size
                                                              (us_split_fields1
                                                              temp___211))) 
                                                          (last1
                                                          (rec__area_math__ensemble__from
                                                          (us_split_fields1
                                                          temp___211))))
                                                          (<= (to_rep
                                                              (rec__area_math__ensemble__size
                                                              (us_split_fields1
                                                              temp___211))) 
                                                          (last1
                                                          (rec__area_math__ensemble__to
                                                          (us_split_fields1
                                                          temp___211))))))

;; def_axiom
  (assert
  (forall ((temp___383 (_ BitVec 32)))
  (=> (dynamic_invariant temp___383 true true true true)
  (= (to_rep2 (select (temp_____aggregate_def_381 temp___383) 1)) temp___383))))

;; def_axiom
  (assert
  (forall ((temp___387 (_ BitVec 32)))
  (=> (dynamic_invariant temp___387 true true true true)
  (= (to_rep2 (select (temp_____aggregate_def_385 temp___387) 1)) temp___387))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; Assume
  (assert (dynamic_invariant from true false true true))

;; Assume
  (assert (dynamic_invariant to__ true false true true))

(assert
;; defqtvc
 ;; File "area_math.ads", line 28, characters 0-0
  (not (dynamic_predicate
  (us_repqtmk1 (us_split_discrsqtmk rliteral)
  (us_split_fieldsqtmk1 rliteral (temp_____aggregate_def_381 from)
  (temp_____aggregate_def_385 to__))))))
(check-sat)
