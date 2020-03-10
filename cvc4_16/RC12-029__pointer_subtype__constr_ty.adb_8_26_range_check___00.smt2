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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

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

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
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
  (forall ((a (Array Int integer)) (b (Array Int integer)))
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
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((a__ref 0))
(((a__refqtmk (a__content us_t)))))
(define-fun a__ref_a__content__projection ((a a__ref)) us_t (a__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__constr_ty__r__x Bool)))))
(define-fun us_split_discrs_rec__constr_ty__r__x__projection ((a us_split_discrs)) Bool 
  (rec__constr_ty__r__x a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__constr_ty__r__x (us_split_discrs1 a)) 1 0) (ite 
                   (rec__constr_ty__r__x (us_split_discrs1 b)) 1 0)) true
                   false))

(define-fun in_range4 ((rec__constr_ty__r__x1 Bool)
  (a us_split_discrs)) Bool (= rec__constr_ty__r__x1 (rec__constr_ty__r__x a)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const constr_ty__r__x__first__bit Int)

(declare-const constr_ty__r__x__last__bit Int)

(declare-const constr_ty__r__x__position Int)

;; constr_ty__r__x__first__bit_axiom
  (assert (<= 0 constr_ty__r__x__first__bit))

;; constr_ty__r__x__last__bit_axiom
  (assert (< constr_ty__r__x__first__bit constr_ty__r__x__last__bit))

;; constr_ty__r__x__position_axiom
  (assert (<= 0 constr_ty__r__x__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_t)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_t 
  (t10b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__constr_ty__a_acc__is_null_pointer Bool)(rec__constr_ty__a_acc__pointer_address Int)(rec__constr_ty__a_acc__pointer_value us_t)))))
(define-fun us_rep_rec__constr_ty__a_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__constr_ty__a_acc__is_null_pointer a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__constr_ty__a_acc__pointer_address a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_value__projection ((a us_rep1)) us_t 
  (rec__constr_ty__a_acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__constr_ty__a_acc__is_null_pointer a) 
                         (rec__constr_ty__a_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__constr_ty__a_acc__is_null_pointer a) true))
                         (and
                         (= (rec__constr_ty__a_acc__pointer_address a) 
                         (rec__constr_ty__a_acc__pointer_address b))
                         (= (rec__constr_ty__a_acc__pointer_value a) 
                         (rec__constr_ty__a_acc__pointer_value b)))))
                    true false))

(define-fun rec__constr_ty__a_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__constr_ty__a_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert (= (rec__constr_ty__a_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy5 us_rep1)

(declare-datatypes ((a_acc__ref 0))
(((a_acc__refqtmk (a_acc__content us_rep1)))))
(define-fun a_acc__ref_a_acc__content__projection ((a a_acc__ref)) us_rep1 
  (a_acc__content a))

(define-fun dynamic_invariant1 ((temp___expr_168 us_rep1)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (not
                                     (= (rec__constr_ty__a_acc__is_null_pointer
                                        temp___expr_168) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__constr_ty__a_acc__pointer_value
                                     temp___expr_168))
                                     (last1
                                     (rec__constr_ty__a_acc__pointer_value
                                     temp___expr_168)))))

(define-fun default_initial_assumption ((temp___expr_170 us_rep1)
  (temp___skip_top_level_171 Bool)) Bool (= (rec__constr_ty__a_acc__is_null_pointer
                                            temp___expr_170) true))

(declare-sort ta_acc_2P1 0)

(declare-fun ta_acc_2P1qtint (ta_acc_2P1) Int)

;; ta_acc_2P1'axiom
  (assert
  (forall ((i ta_acc_2P1))
  (and (<= 1 (ta_acc_2P1qtint i)) (<= (ta_acc_2P1qtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (ta_acc_2P1 ta_acc_2P1) Bool)

(declare-const dummy6 ta_acc_2P1)

(declare-datatypes ((ta_acc_2P1__ref 0))
(((ta_acc_2P1__refqtmk (ta_acc_2P1__content ta_acc_2P1)))))
(define-fun ta_acc_2P1__ref_ta_acc_2P1__content__projection ((a ta_acc_2P1__ref)) ta_acc_2P1 
  (ta_acc_2P1__content a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__constr_ty__a_acc__is_null_pointer1 Bool)(rec__constr_ty__a_acc__pointer_address1 Int)(rec__constr_ty__a_acc__pointer_value1 (Array Int integer))))))
(define-fun us_rep_rec__constr_ty__a_acc__is_null_pointer__2__projection ((a us_rep2)) Bool 
  (rec__constr_ty__a_acc__is_null_pointer1 a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_address__2__projection ((a us_rep2)) Int 
  (rec__constr_ty__a_acc__pointer_address1 a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_value__2__projection ((a us_rep2)) (Array Int integer) 
  (rec__constr_ty__a_acc__pointer_value1 a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__constr_ty__a_acc__is_null_pointer1 a) 
                         (rec__constr_ty__a_acc__is_null_pointer1 b))
                         (=>
                         (not
                         (= (rec__constr_ty__a_acc__is_null_pointer1 a) true))
                         (and
                         (= (rec__constr_ty__a_acc__pointer_address1 a) 
                         (rec__constr_ty__a_acc__pointer_address1 b))
                         (= (rec__constr_ty__a_acc__pointer_value1 a) 
                         (rec__constr_ty__a_acc__pointer_value1 b)))))
                    true false))

(define-fun rec__constr_ty__a_acc_2__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__constr_ty__a_acc__is_null_pointer1 a) true)))

(declare-const us_null_pointer1 us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__constr_ty__a_acc__is_null_pointer1 us_null_pointer1) true))

(define-fun to_base ((a us_rep2)) us_rep1 (us_repqtmk1
                                          (rec__constr_ty__a_acc__is_null_pointer1
                                          a)
                                          (rec__constr_ty__a_acc__pointer_address1
                                          a)
                                          (of_array
                                          (rec__constr_ty__a_acc__pointer_value1
                                          a) 1 10)))

(define-fun of_base ((r us_rep1)) us_rep2 (us_repqtmk2
                                          (rec__constr_ty__a_acc__is_null_pointer
                                          r)
                                          (rec__constr_ty__a_acc__pointer_address
                                          r)
                                          (let ((temp___155 (rec__constr_ty__a_acc__pointer_value
                                                            r)))
                                          (to_array temp___155))))

(define-fun in_range6 ((first2 Int) (last2 Int)
  (r us_rep1)) Bool (=>
                    (not (= (rec__constr_ty__a_acc__is_null_pointer r) true))
                    (and
                    (= (first1 (rec__constr_ty__a_acc__pointer_value r)) first2)
                    (= (last1 (rec__constr_ty__a_acc__pointer_value r)) last2))))

(declare-const dummy7 us_rep2)

(declare-datatypes ((a_acc_2__ref 0))
(((a_acc_2__refqtmk (a_acc_2__content us_rep2)))))
(define-fun a_acc_2__ref_a_acc_2__content__projection ((a a_acc_2__ref)) us_rep2 
  (a_acc_2__content a))

(define-fun default_initial_assumption1 ((temp___expr_177 us_rep2)
  (temp___skip_top_level_178 Bool)) Bool (= (rec__constr_ty__a_acc__is_null_pointer1
                                            temp___expr_177) true))

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3
  (rec__constr_ty__r_acc__is_null_pointer Bool)(rec__constr_ty__r_acc__pointer_address Int)(rec__constr_ty__r_acc__pointer_value us_rep)))))
(define-fun us_rep_rec__constr_ty__r_acc__is_null_pointer__projection ((a us_rep3)) Bool 
  (rec__constr_ty__r_acc__is_null_pointer a))

(define-fun us_rep_rec__constr_ty__r_acc__pointer_address__projection ((a us_rep3)) Int 
  (rec__constr_ty__r_acc__pointer_address a))

(define-fun us_rep_rec__constr_ty__r_acc__pointer_value__projection ((a us_rep3)) us_rep 
  (rec__constr_ty__r_acc__pointer_value a))

(declare-datatypes ((us_rep__ref2 0))
(((us_rep__refqtmk2 (us_rep__content2 us_rep3)))))
(define-fun us_rep__ref___rep__content__3__projection ((a us_rep__ref2)) us_rep3 
  (us_rep__content2 a))

(define-fun bool_eq5 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (rec__constr_ty__r_acc__is_null_pointer a) 
                         (rec__constr_ty__r_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__constr_ty__r_acc__is_null_pointer a) true))
                         (and
                         (= (rec__constr_ty__r_acc__pointer_address a) 
                         (rec__constr_ty__r_acc__pointer_address b))
                         (= (rec__constr_ty__r_acc__pointer_value a) 
                         (rec__constr_ty__r_acc__pointer_value b)))))
                    true false))

(define-fun rec__constr_ty__r_acc__pointer_value__pred ((a us_rep3)) Bool 
  (not (= (rec__constr_ty__r_acc__is_null_pointer a) true)))

(declare-const us_null_pointer2 us_rep3)

;; __null_pointer__def_axiom
  (assert (= (rec__constr_ty__r_acc__is_null_pointer us_null_pointer2) true))

(declare-const dummy8 us_rep3)

(declare-datatypes ((r_acc__ref 0))
(((r_acc__refqtmk (r_acc__content us_rep3)))))
(define-fun r_acc__ref_r_acc__content__projection ((a r_acc__ref)) us_rep3 
  (r_acc__content a))

(define-fun default_initial_assumption2 ((temp___expr_190 us_rep3)
  (temp___skip_top_level_191 Bool)) Bool (= (rec__constr_ty__r_acc__is_null_pointer
                                            temp___expr_190) true))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const constr_ty__r__x__first__bit1 Int)

(declare-const constr_ty__r__x__last__bit1 Int)

(declare-const constr_ty__r__x__position1 Int)

;; constr_ty__r__x__first__bit_axiom
  (assert (<= 0 constr_ty__r__x__first__bit1))

;; constr_ty__r__x__last__bit_axiom
  (assert (< constr_ty__r__x__first__bit1 constr_ty__r__x__last__bit1))

;; constr_ty__r__x__position_axiom
  (assert (<= 0 constr_ty__r__x__position1))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy9 us_rep)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_rep)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_rep (t8b__content
                                                                    a))

(declare-datatypes ((us_rep4 0))
(((us_repqtmk4
  (rec__constr_ty__a_acc__is_null_pointer2 Bool)(rec__constr_ty__a_acc__pointer_address2 Int)(rec__constr_ty__a_acc__pointer_value2 us_t)))))
(define-fun us_rep_rec__constr_ty__a_acc__is_null_pointer__3__projection ((a us_rep4)) Bool 
  (rec__constr_ty__a_acc__is_null_pointer2 a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_address__3__projection ((a us_rep4)) Int 
  (rec__constr_ty__a_acc__pointer_address2 a))

(define-fun us_rep_rec__constr_ty__a_acc__pointer_value__3__projection ((a us_rep4)) us_t 
  (rec__constr_ty__a_acc__pointer_value2 a))

(declare-datatypes ((us_rep__ref3 0))
(((us_rep__refqtmk3 (us_rep__content3 us_rep4)))))
(define-fun us_rep__ref___rep__content__4__projection ((a us_rep__ref3)) us_rep4 
  (us_rep__content3 a))

(define-fun bool_eq6 ((a us_rep4)
  (b us_rep4)) Bool (ite (and
                         (= (rec__constr_ty__a_acc__is_null_pointer2 a) 
                         (rec__constr_ty__a_acc__is_null_pointer2 b))
                         (=>
                         (not
                         (= (rec__constr_ty__a_acc__is_null_pointer2 a) true))
                         (and
                         (= (rec__constr_ty__a_acc__pointer_address2 a) 
                         (rec__constr_ty__a_acc__pointer_address2 b))
                         (= (rec__constr_ty__a_acc__pointer_value2 a) 
                         (rec__constr_ty__a_acc__pointer_value2 b)))))
                    true false))

(define-fun rec__constr_ty__B_2__a_acc_3__pointer_value__pred ((a us_rep4)) Bool 
  (not (= (rec__constr_ty__a_acc__is_null_pointer2 a) true)))

(declare-const us_null_pointer3 us_rep4)

;; __null_pointer__def_axiom
  (assert
  (= (rec__constr_ty__a_acc__is_null_pointer2 us_null_pointer3) true))

(define-fun to_base1 ((a us_rep4)) us_rep1 (us_repqtmk1
                                           (rec__constr_ty__a_acc__is_null_pointer2
                                           a)
                                           (rec__constr_ty__a_acc__pointer_address2
                                           a)
                                           (let ((temp___156 (rec__constr_ty__a_acc__pointer_value2
                                                             a)))
                                           (of_array (to_array temp___156)
                                           (first1 temp___156)
                                           (last1 temp___156)))))

(define-fun of_base1 ((r us_rep1)) us_rep4 (us_repqtmk4
                                           (rec__constr_ty__a_acc__is_null_pointer
                                           r)
                                           (rec__constr_ty__a_acc__pointer_address
                                           r)
                                           (let ((temp___157 (rec__constr_ty__a_acc__pointer_value
                                                             r)))
                                           (of_array (to_array temp___157)
                                           (first1 temp___157)
                                           (last1 temp___157)))))

(define-fun in_range7 ((first2 Int) (last2 Int)
  (r us_rep1)) Bool (=>
                    (not (= (rec__constr_ty__a_acc__is_null_pointer r) true))
                    (and
                    (= (first1 (rec__constr_ty__a_acc__pointer_value r)) first2)
                    (= (last1 (rec__constr_ty__a_acc__pointer_value r)) last2))))

(declare-const dummy10 us_rep4)

(declare-datatypes ((a_acc_3__ref 0))
(((a_acc_3__refqtmk (a_acc_3__content us_rep4)))))
(define-fun a_acc_3__ref_a_acc_3__content__projection ((a a_acc_3__ref)) us_rep4 
  (a_acc_3__content a))

(define-fun dynamic_invariant2 ((temp___expr_196 us_rep4)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool) (temp___do_typ_inv_195 Bool)
  (constr_ty__L_1__i Int)) Bool (=>
                                (not
                                (= (rec__constr_ty__a_acc__is_null_pointer2
                                   temp___expr_196) true))
                                (and (dynamic_property 1 constr_ty__L_1__i
                                (first1
                                (rec__constr_ty__a_acc__pointer_value2
                                temp___expr_196))
                                (last1
                                (rec__constr_ty__a_acc__pointer_value2
                                temp___expr_196)))
                                (and
                                (= (first1
                                   (rec__constr_ty__a_acc__pointer_value2
                                   temp___expr_196)) 1)
                                (= (last1
                                   (rec__constr_ty__a_acc__pointer_value2
                                   temp___expr_196)) constr_ty__L_1__i)))))

(define-fun default_initial_assumption3 ((temp___expr_198 us_rep4)
  (temp___skip_top_level_199 Bool)) Bool (= (rec__constr_ty__a_acc__is_null_pointer2
                                            temp___expr_198) true))

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-fun temp_____aggregate_def_200 (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_212 (Int Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_162 us_t)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (not (= temp___skip_constant_159 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_162)
                                     (last1 temp___expr_162))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___202 Int) (temp___203 Int) (temp___204 Int))
  (let ((temp___201 (temp_____aggregate_def_200 temp___202 temp___203
                    temp___204)))
  (=> (dynamic_invariant3 temp___202 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___203 temp___204)
  (and (= (first1 temp___201) temp___203) (= (last1 temp___201) temp___204)))
  (forall ((temp___205 Int))
  (= (select (to_array temp___201) temp___205) rliteral)))))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___214 Int) (temp___215 Int) (temp___216 Int))
  (let ((temp___213 (temp_____aggregate_def_212 temp___214 temp___215
                    temp___216)))
  (=> (dynamic_invariant3 temp___214 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___215 temp___216)
  (and (= (first1 temp___213) temp___215) (= (last1 temp___213) temp___216)))
  (forall ((temp___217 Int))
  (= (select (to_array temp___213) temp___217) rliteral1)))))))

(assert
;; defqtvc
 ;; File "constr_ty.adb", line 1, characters 0-0
  (not
  (=> (dynamic_invariant c true false true true) (=> (<= 1 c) (<= 1 1)))))
(check-sat)
(exit)
