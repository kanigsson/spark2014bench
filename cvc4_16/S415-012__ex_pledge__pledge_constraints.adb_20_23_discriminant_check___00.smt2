(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__pledge_constraints__int_acc__is_null_pointer Bool)(rec__pledge_constraints__int_acc__pointer_address Int)(rec__pledge_constraints__int_acc__pointer_value integer)))))
(define-fun us_rep_rec__pledge_constraints__int_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__pledge_constraints__int_acc__is_null_pointer a))

(define-fun us_rep_rec__pledge_constraints__int_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__pledge_constraints__int_acc__pointer_address a))

(define-fun us_rep_rec__pledge_constraints__int_acc__pointer_value__projection ((a us_rep)) integer 
  (rec__pledge_constraints__int_acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__pledge_constraints__int_acc__is_null_pointer
                           a) (rec__pledge_constraints__int_acc__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__pledge_constraints__int_acc__is_null_pointer
                           a) true))
                        (and
                        (= (rec__pledge_constraints__int_acc__pointer_address
                           a) (rec__pledge_constraints__int_acc__pointer_address
                              b))
                        (= (rec__pledge_constraints__int_acc__pointer_value
                           a) (rec__pledge_constraints__int_acc__pointer_value
                              b)))))
                   true false))

(define-fun rec__pledge_constraints__int_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__pledge_constraints__int_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__pledge_constraints__int_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep)

(declare-datatypes ((int_acc__ref 0))
(((int_acc__refqtmk (int_acc__content us_rep)))))
(define-fun int_acc__ref_int_acc__content__projection ((a int_acc__ref)) us_rep 
  (int_acc__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__pledge_constraints__int_acc_option__present Bool)))))
(define-fun us_split_discrs_rec__pledge_constraints__int_acc_option__present__projection ((a us_split_discrs)) Bool 
  (rec__pledge_constraints__int_acc_option__present a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__pledge_constraints__int_acc_option__content us_rep)))))
(define-fun us_split_fields_rec__pledge_constraints__int_acc_option__content__projection ((a us_split_fields)) us_rep 
  (rec__pledge_constraints__int_acc_option__content a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun pledge_constraints__int_acc_option__content__pred ((a us_rep1)) Bool (= (ite 
  (rec__pledge_constraints__int_acc_option__present (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__pledge_constraints__int_acc_option__present
                                 (us_split_discrs1 a)) 1 0) (ite (rec__pledge_constraints__int_acc_option__present
                                                                 (us_split_discrs1
                                                                 b)) 1 0))
                         (=>
                         (pledge_constraints__int_acc_option__content__pred
                         a)
                         (= (bool_eq
                            (rec__pledge_constraints__int_acc_option__content
                            (us_split_fields1 a))
                            (rec__pledge_constraints__int_acc_option__content
                            (us_split_fields1 b))) true)))
                    true false))

(define-fun in_range3 ((rec__pledge_constraints__int_acc_option__present1 Bool)
  (a us_split_discrs)) Bool (= rec__pledge_constraints__int_acc_option__present1 
  (rec__pledge_constraints__int_acc_option__present a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const pledge_constraints__int_acc_option__present__first__bit Int)

(declare-const pledge_constraints__int_acc_option__present__last__bit Int)

(declare-const pledge_constraints__int_acc_option__present__position Int)

;; pledge_constraints__int_acc_option__present__first__bit_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__present__first__bit))

;; pledge_constraints__int_acc_option__present__last__bit_axiom
  (assert
  (< pledge_constraints__int_acc_option__present__first__bit pledge_constraints__int_acc_option__present__last__bit))

;; pledge_constraints__int_acc_option__present__position_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__present__position))

(declare-const pledge_constraints__int_acc_option__content__first__bit Int)

(declare-const pledge_constraints__int_acc_option__content__last__bit Int)

(declare-const pledge_constraints__int_acc_option__content__position Int)

;; pledge_constraints__int_acc_option__content__first__bit_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__content__first__bit))

;; pledge_constraints__int_acc_option__content__last__bit_axiom
  (assert
  (< pledge_constraints__int_acc_option__content__first__bit pledge_constraints__int_acc_option__content__last__bit))

;; pledge_constraints__int_acc_option__content__position_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__content__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((int_acc_option__ref 0))
(((int_acc_option__refqtmk (int_acc_option__content us_rep1)))))
(define-fun int_acc_option__ref_int_acc_option__content__projection ((a int_acc_option__ref)) us_rep1 
  (int_acc_option__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep1))))))
(declare-fun slide ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq1 (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq1 (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep1))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep1) (elts a))

(define-fun of_array ((a (Array Int us_rep1)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq2 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((int_opt_arr__ref 0))
(((int_opt_arr__refqtmk (int_opt_arr__content us_t)))))
(define-fun int_opt_arr__ref_int_opt_arr__content__projection ((a int_opt_arr__ref)) us_t 
  (int_opt_arr__content a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__pledge_constraints__int_arr_acc__is_null_pointer Bool)(rec__pledge_constraints__int_arr_acc__pointer_address Int)(rec__pledge_constraints__int_arr_acc__pointer_value us_t)))))
(define-fun us_rep_rec__pledge_constraints__int_arr_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__pledge_constraints__int_arr_acc__is_null_pointer a))

(define-fun us_rep_rec__pledge_constraints__int_arr_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__pledge_constraints__int_arr_acc__pointer_address a))

(define-fun us_rep_rec__pledge_constraints__int_arr_acc__pointer_value__projection ((a us_rep2)) us_t 
  (rec__pledge_constraints__int_arr_acc__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                            a) (rec__pledge_constraints__int_arr_acc__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                            a) true))
                         (and
                         (= (rec__pledge_constraints__int_arr_acc__pointer_address
                            a) (rec__pledge_constraints__int_arr_acc__pointer_address
                               b))
                         (= (rec__pledge_constraints__int_arr_acc__pointer_value
                            a) (rec__pledge_constraints__int_arr_acc__pointer_value
                               b)))))
                    true false))

(define-fun rec__pledge_constraints__int_arr_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__pledge_constraints__int_arr_acc__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__pledge_constraints__int_arr_acc__is_null_pointer us_null_pointer1) true))

(declare-const dummy5 us_rep2)

(declare-datatypes ((int_arr_acc__ref 0))
(((int_arr_acc__refqtmk (int_arr_acc__content us_rep2)))))
(define-fun int_arr_acc__ref_int_arr_acc__content__projection ((a int_arr_acc__ref)) us_rep2 
  (int_arr_acc__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__pledge_constraints__two_arrays__a1 us_rep2)(rec__pledge_constraints__two_arrays__a2 us_rep2)))))
(define-fun us_split_fields_rec__pledge_constraints__two_arrays__a1__projection ((a us_split_fields2)) us_rep2 
  (rec__pledge_constraints__two_arrays__a1 a))

(define-fun us_split_fields_rec__pledge_constraints__two_arrays__a2__projection ((a us_split_fields2)) us_rep2 
  (rec__pledge_constraints__two_arrays__a2 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep3)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq5 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (bool_eq4
                            (rec__pledge_constraints__two_arrays__a1
                            (us_split_fields3 a))
                            (rec__pledge_constraints__two_arrays__a1
                            (us_split_fields3 b))) true)
                         (= (bool_eq4
                            (rec__pledge_constraints__two_arrays__a2
                            (us_split_fields3 a))
                            (rec__pledge_constraints__two_arrays__a2
                            (us_split_fields3 b))) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const pledge_constraints__two_arrays__a1__first__bit Int)

(declare-const pledge_constraints__two_arrays__a1__last__bit Int)

(declare-const pledge_constraints__two_arrays__a1__position Int)

;; pledge_constraints__two_arrays__a1__first__bit_axiom
  (assert (<= 0 pledge_constraints__two_arrays__a1__first__bit))

;; pledge_constraints__two_arrays__a1__last__bit_axiom
  (assert
  (< pledge_constraints__two_arrays__a1__first__bit pledge_constraints__two_arrays__a1__last__bit))

;; pledge_constraints__two_arrays__a1__position_axiom
  (assert (<= 0 pledge_constraints__two_arrays__a1__position))

(declare-const pledge_constraints__two_arrays__a2__first__bit Int)

(declare-const pledge_constraints__two_arrays__a2__last__bit Int)

(declare-const pledge_constraints__two_arrays__a2__position Int)

;; pledge_constraints__two_arrays__a2__first__bit_axiom
  (assert (<= 0 pledge_constraints__two_arrays__a2__first__bit))

;; pledge_constraints__two_arrays__a2__last__bit_axiom
  (assert
  (< pledge_constraints__two_arrays__a2__first__bit pledge_constraints__two_arrays__a2__last__bit))

;; pledge_constraints__two_arrays__a2__position_axiom
  (assert (<= 0 pledge_constraints__two_arrays__a2__position))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy6 us_rep3)

(declare-datatypes ((two_arrays__ref 0))
(((two_arrays__refqtmk (two_arrays__content us_rep3)))))
(define-fun two_arrays__ref_two_arrays__content__projection ((a two_arrays__ref)) us_rep3 
  (two_arrays__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_214 us_rep3)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (and
                                     (=>
                                     (not
                                     (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                        (rec__pledge_constraints__two_arrays__a1
                                        (us_split_fields3 temp___expr_214))) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     (rec__pledge_constraints__two_arrays__a1
                                     (us_split_fields3 temp___expr_214))))
                                     (last1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     (rec__pledge_constraints__two_arrays__a1
                                     (us_split_fields3 temp___expr_214))))))
                                     (=>
                                     (not
                                     (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                        (rec__pledge_constraints__two_arrays__a2
                                        (us_split_fields3 temp___expr_214))) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     (rec__pledge_constraints__two_arrays__a2
                                     (us_split_fields3 temp___expr_214))))
                                     (last1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     (rec__pledge_constraints__two_arrays__a2
                                     (us_split_fields3 temp___expr_214))))))))

(define-fun default_initial_assumption ((temp___expr_219 us_rep3)
  (temp___skip_top_level_220 Bool)) Bool (and
                                         (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                            (rec__pledge_constraints__two_arrays__a1
                                            (us_split_fields3
                                            temp___expr_219))) true)
                                         (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                            (rec__pledge_constraints__two_arrays__a2
                                            (us_split_fields3
                                            temp___expr_219))) true)))

(declare-const dummy7 us_rep)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep (t5b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep3 us_rep) Bool)

(declare-sort t8b 0)

(declare-fun t8bqtint (t8b) Int)

;; t8b'axiom
  (assert (forall ((i t8b)) (and (<= 1 (t8bqtint i)) (<= (t8bqtint i) 3))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (t8b t8b) Bool)

(declare-const dummy8 t8b)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content t8b)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) t8b (t8b__content
                                                                 a))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const pledge_constraints__int_acc_option__present__first__bit1 Int)

(declare-const pledge_constraints__int_acc_option__present__last__bit1 Int)

(declare-const pledge_constraints__int_acc_option__present__position1 Int)

;; pledge_constraints__int_acc_option__present__first__bit_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__present__first__bit1))

;; pledge_constraints__int_acc_option__present__last__bit_axiom
  (assert
  (< pledge_constraints__int_acc_option__present__first__bit1 pledge_constraints__int_acc_option__present__last__bit1))

;; pledge_constraints__int_acc_option__present__position_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__present__position1))

(declare-const pledge_constraints__int_acc_option__content__first__bit1 Int)

(declare-const pledge_constraints__int_acc_option__content__last__bit1 Int)

(declare-const pledge_constraints__int_acc_option__content__position1 Int)

;; pledge_constraints__int_acc_option__content__first__bit_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__content__first__bit1))

;; pledge_constraints__int_acc_option__content__last__bit_axiom
  (assert
  (< pledge_constraints__int_acc_option__content__first__bit1 pledge_constraints__int_acc_option__content__last__bit1))

;; pledge_constraints__int_acc_option__content__position_axiom
  (assert (<= 0 pledge_constraints__int_acc_option__content__position1))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy9 us_rep1)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content us_rep1)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_rep1 
  (t7b__content a))

(declare-fun temp_____aggregate_def_239 (us_rep1) (Array Int us_rep1))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun default_initial_assumption1 ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (rec__pledge_constraints__int_acc__is_null_pointer
                                            temp___expr_182) true))

(define-fun default_initial_assumption2 ((temp___expr_190 us_rep1)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (= (rec__pledge_constraints__int_acc_option__present
                                            (us_split_discrs1
                                            temp___expr_190)) (distinct 0 0))
                                         (=>
                                         (pledge_constraints__int_acc_option__content__pred
                                         temp___expr_190)
                                         (= (rec__pledge_constraints__int_acc__is_null_pointer
                                            (rec__pledge_constraints__int_acc_option__content
                                            (us_split_fields1
                                            temp___expr_190))) true))))

(define-fun dynamic_invariant3 ((temp___expr_198 us_t)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (not (= temp___skip_constant_195 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_198)
                                     (last1 temp___expr_198))))

(define-fun dynamic_invariant4 ((temp___expr_205 us_rep2)
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (=>
                                     (not
                                     (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                        temp___expr_205) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     temp___expr_205))
                                     (last1
                                     (rec__pledge_constraints__int_arr_acc__pointer_value
                                     temp___expr_205)))))

(define-fun default_initial_assumption3 ((temp___expr_208 us_rep2)
  (temp___skip_top_level_209 Bool)) Bool (= (rec__pledge_constraints__int_arr_acc__is_null_pointer
                                            temp___expr_208) true))

;; def_axiom
  (assert
  (forall ((temp___241 us_rep1))
  (forall ((temp___242 Int))
  (= (select (temp_____aggregate_def_239 temp___241) temp___242) temp___241))))

(assert
;; defqtvc
 ;; File "pledge_constraints.adb", line 18, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields2) (o Bool))
  (=> (dynamic_invariant (us_repqtmk3 x__split_fields) true false true true)
  (=>
  (ite (= (not (bool_eq4
               (rec__pledge_constraints__two_arrays__a1 x__split_fields)
               us_null_pointer1)) true)
  (= o (and (ite (<= (first1
                     (rec__pledge_constraints__int_arr_acc__pointer_value
                     (rec__pledge_constraints__two_arrays__a1
                     x__split_fields))) 1)
            true false) (ite (<= 1 (last1
                                   (rec__pledge_constraints__int_arr_acc__pointer_value
                                   (rec__pledge_constraints__two_arrays__a1
                                   x__split_fields))))
                        true false)))
  (= o false))
  (=>
  (or (not (= o true))
  (let ((temp___294 (rec__pledge_constraints__int_arr_acc__pointer_value
                    (rec__pledge_constraints__two_arrays__a1 x__split_fields))))
  (and (<= (first1 temp___294) 1) (<= 1 (last1 temp___294)))))
  (=>
  (= (ite (= o true)
     (rec__pledge_constraints__int_acc_option__present
     (us_split_discrs1
     (select (to_array
             (rec__pledge_constraints__int_arr_acc__pointer_value
             (rec__pledge_constraints__two_arrays__a1 x__split_fields))) 1)))
     false) true)
  (let ((temp___296 (rec__pledge_constraints__int_arr_acc__pointer_value
                    (rec__pledge_constraints__two_arrays__a1 x__split_fields))))
  (=> (and (<= (first1 temp___296) 1) (<= 1 (last1 temp___296)))
  (pledge_constraints__int_acc_option__content__pred
  (select (to_array temp___296) 1)))))))))))
(check-sat)
(exit)
