;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
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

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
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
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
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
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
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

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__record_discr__interm_result__upto natural)))))
(define-fun us_split_discrs_rec__record_discr__interm_result__upto__projection ((a us_split_discrs)) natural 
  (rec__record_discr__interm_result__upto a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__record_discr__interm_result__to_search us_t)))))
(define-fun us_split_fields_rec__record_discr__interm_result__to_search__projection ((a us_split_fields)) us_t 
  (rec__record_discr__interm_result__to_search a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__record_discr__interm_result__upto
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__record_discr__interm_result__upto
                                                  (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__record_discr__interm_result__to_search
                           (us_split_fields1 a))
                           (rec__record_discr__interm_result__to_search
                           (us_split_fields1 b))) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const record_discr__interm_result__upto__first__bit Int)

(declare-const record_discr__interm_result__upto__last__bit Int)

(declare-const record_discr__interm_result__upto__position Int)

;; record_discr__interm_result__upto__first__bit_axiom
  (assert (<= 0 record_discr__interm_result__upto__first__bit))

;; record_discr__interm_result__upto__last__bit_axiom
  (assert
  (< record_discr__interm_result__upto__first__bit record_discr__interm_result__upto__last__bit))

;; record_discr__interm_result__upto__position_axiom
  (assert (<= 0 record_discr__interm_result__upto__position))

(declare-const record_discr__interm_result__to_search__first__bit Int)

(declare-const record_discr__interm_result__to_search__last__bit Int)

(declare-const record_discr__interm_result__to_search__position Int)

;; record_discr__interm_result__to_search__first__bit_axiom
  (assert (<= 0 record_discr__interm_result__to_search__first__bit))

;; record_discr__interm_result__to_search__last__bit_axiom
  (assert
  (< record_discr__interm_result__to_search__first__bit record_discr__interm_result__to_search__last__bit))

;; record_discr__interm_result__to_search__position_axiom
  (assert (<= 0 record_discr__interm_result__to_search__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((interm_result__ref 0))
(((interm_result__refqtmk (interm_result__content us_rep)))))
(define-fun interm_result__ref_interm_result__content__projection ((a interm_result__ref)) us_rep 
  (interm_result__content a))

(declare-sort tT5sP1 0)

(declare-fun tT5sP1qtint (tT5sP1) Int)

;; tT5sP1'axiom
  (assert
  (forall ((i tT5sP1)) (and (<= 1 (tT5sP1qtint i)) (<= (tT5sP1qtint i) 3))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (tT5sP1 tT5sP1) Bool)

(declare-const dummy5 tT5sP1)

(declare-datatypes ((tT5sP1__ref 0))
(((tT5sP1__refqtmk (tT5sP1__content tT5sP1)))))
(define-fun tT5sP1__ref_tT5sP1__content__projection ((a tT5sP1__ref)) tT5sP1 
  (tT5sP1__content a))

(declare-const dummy6 (Array Int natural))

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

(declare-fun user_eq6 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__record_discr__interm_result__to_search1 (Array Int natural))))))
(define-fun us_split_fields_rec__record_discr__interm_result__to_search__2__projection ((a us_split_fields2)) (Array Int natural) 
  (rec__record_discr__interm_result__to_search1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (of_array
                                         (rec__record_discr__interm_result__to_search1
                                         (us_split_fields3 a)) 1 3))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___155 (rec__record_discr__interm_result__to_search
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___155)))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__record_discr__interm_result__upto
                            (us_split_discrs2 a))) (to_rep
                                                   (rec__record_discr__interm_result__upto
                                                   (us_split_discrs2 b))))
                         (= (bool_eq
                            (rec__record_discr__interm_result__to_search1
                            (us_split_fields3 a)) 1 3
                            (rec__record_discr__interm_result__to_search1
                            (us_split_fields3 b)) 1 3) true))
                    true false))

(define-fun in_range5 ((rec__record_discr__interm_result__upto1 Int)
  (a us_rep)) Bool (= rec__record_discr__interm_result__upto1 (to_rep
                                                              (rec__record_discr__interm_result__upto
                                                              (us_split_discrs1
                                                              a)))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const record_discr__interm_result__upto__first__bit1 Int)

(declare-const record_discr__interm_result__upto__last__bit1 Int)

(declare-const record_discr__interm_result__upto__position1 Int)

;; record_discr__interm_result__upto__first__bit_axiom
  (assert (<= 0 record_discr__interm_result__upto__first__bit1))

;; record_discr__interm_result__upto__last__bit_axiom
  (assert
  (< record_discr__interm_result__upto__first__bit1 record_discr__interm_result__upto__last__bit1))

;; record_discr__interm_result__upto__position_axiom
  (assert (<= 0 record_discr__interm_result__upto__position1))

(declare-const record_discr__interm_result__to_search__first__bit1 Int)

(declare-const record_discr__interm_result__to_search__last__bit1 Int)

(declare-const record_discr__interm_result__to_search__position1 Int)

;; record_discr__interm_result__to_search__first__bit_axiom
  (assert (<= 0 record_discr__interm_result__to_search__first__bit1))

;; record_discr__interm_result__to_search__last__bit_axiom
  (assert
  (< record_discr__interm_result__to_search__first__bit1 record_discr__interm_result__to_search__last__bit1))

;; record_discr__interm_result__to_search__position_axiom
  (assert (<= 0 record_discr__interm_result__to_search__position1))

(declare-fun user_eq7 (us_rep1 us_rep1) Bool)

(declare-const dummy7 us_rep1)

(declare-datatypes ((result_3__ref 0))
(((result_3__refqtmk (result_3__content us_rep1)))))
(define-fun result_3__ref_result_3__content__projection ((a result_3__ref)) us_rep1 
  (result_3__content a))

(declare-const r us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs3 0))
(((us_split_discrsqtmk1 (rec__private_record__result_ty__found Bool)))))
(define-fun us_split_discrs_rec__private_record__result_ty__found__projection ((a us_split_discrs3)) Bool 
  (rec__private_record__result_ty__found a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs3)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs3 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__private_record__result_ty us_main_type)))))
(define-fun us_split_fields_rec__private_record__result_ty__projection ((a us_split_fields4)) us_main_type 
  (rec__private_record__result_ty a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (us_split_discrs4 us_split_discrs3)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs3 
  (us_split_discrs4 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (ite (rec__private_record__result_ty__found
                                 (us_split_discrs4 a)) 1 0) (ite (rec__private_record__result_ty__found
                                                                 (us_split_discrs4
                                                                 b)) 1 0))
                         (= (us_main_eq
                            (rec__private_record__result_ty
                            (us_split_fields5 a))
                            (rec__private_record__result_ty
                            (us_split_fields5 b))) true))
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

(declare-const private_record__result_ty__found__first__bit Int)

(declare-const private_record__result_ty__found__last__bit Int)

(declare-const private_record__result_ty__found__position Int)

;; private_record__result_ty__found__first__bit_axiom
  (assert (<= 0 private_record__result_ty__found__first__bit))

;; private_record__result_ty__found__last__bit_axiom
  (assert
  (< private_record__result_ty__found__first__bit private_record__result_ty__found__last__bit))

;; private_record__result_ty__found__position_axiom
  (assert (<= 0 private_record__result_ty__found__position))

(declare-fun user_eq8 (us_rep2 us_rep2) Bool)

(declare-const dummy8 us_rep2)

(declare-datatypes ((result_ty__ref 0))
(((result_ty__refqtmk (result_ty__content us_rep2)))))
(define-fun result_ty__ref_result_ty__content__projection ((a result_ty__ref)) us_rep2 
  (result_ty__content a))

(declare-fun get_content (us_rep2) Int)

(declare-fun get_content__function_guard (Int us_rep2) Bool)

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

;; get_content__post_axiom
  (assert
  (forall ((r1 us_rep2)) (! (in_range3
  (get_content r1)) :pattern ((get_content r1)) )))

(declare-fun mk_result (Bool Int) us_rep2)

(declare-fun mk_result__function_guard (us_rep2 Bool Int) Bool)

;; mk_result__post_axiom
  (assert
  (forall ((found Bool))
  (forall ((content Int))
  (! (=> (dynamic_invariant1 content true true true true)
     (let ((result (mk_result found content)))
     (and
     (forall ((result1 us_rep2)) (get_content__function_guard
     (get_content result1) result1))
     (=> (mk_result__function_guard result found content)
     (and
     (=
     (= (rec__private_record__result_ty__found (us_split_discrs4 result)) true)
     (= found true)) (=> (= found true) (= (get_content result) content))))))) :pattern (
  (mk_result found content)) ))))

(define-fun dynamic_invariant2 ((temp___expr_189 us_rep1)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (not (= temp___skip_constant_186 true))
                                     (in_range5 3 (to_base temp___expr_189))))

(define-fun default_initial_assumption ((temp___expr_192 us_rep1)
  (temp___skip_top_level_193 Bool)) Bool (= (to_rep
                                            (rec__record_discr__interm_result__upto
                                            (us_split_discrs2
                                            temp___expr_192))) 3))

(define-fun dynamic_invariant3 ((temp___expr_182 us_rep)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (let ((temp___183 (rec__record_discr__interm_result__upto
                                                       (us_split_discrs1
                                                       temp___expr_182))))
                                     (and (dynamic_property 1
                                     (to_rep temp___183)
                                     (first1
                                     (rec__record_discr__interm_result__to_search
                                     (us_split_fields1 temp___expr_182)))
                                     (last1
                                     (rec__record_discr__interm_result__to_search
                                     (us_split_fields1 temp___expr_182))))
                                     (and
                                     (= (first1
                                        (rec__record_discr__interm_result__to_search
                                        (us_split_fields1 temp___expr_182))) 1)
                                     (= (last1
                                        (rec__record_discr__interm_result__to_search
                                        (us_split_fields1 temp___expr_182))) 
                                     (to_rep temp___183))))))

(assert
;; defqtvc
 ;; File "record_discr.ads", line 13, characters 0-0
  (not true))
(check-sat)