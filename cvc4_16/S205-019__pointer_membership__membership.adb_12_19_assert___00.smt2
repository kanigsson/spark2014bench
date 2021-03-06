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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__membership__ptr__is_null_pointer Bool)(rec__membership__ptr__pointer_address Int)(rec__membership__ptr__pointer_value us_t)))))
(define-fun us_rep_rec__membership__ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__membership__ptr__is_null_pointer a))

(define-fun us_rep_rec__membership__ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__membership__ptr__pointer_address a))

(define-fun us_rep_rec__membership__ptr__pointer_value__projection ((a us_rep)) us_t 
  (rec__membership__ptr__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__membership__ptr__is_null_pointer a) 
                        (rec__membership__ptr__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__membership__ptr__is_null_pointer a) true))
                        (and
                        (= (rec__membership__ptr__pointer_address a) 
                        (rec__membership__ptr__pointer_address b))
                        (= (rec__membership__ptr__pointer_value a) (rec__membership__ptr__pointer_value
                                                                   b)))))
                   true false))

(define-fun rec__membership__ptr__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__membership__ptr__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__membership__ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep)

(declare-datatypes ((ptr__ref 0))
(((ptr__refqtmk (ptr__content us_rep)))))
(define-fun ptr__ref_ptr__content__projection ((a ptr__ref)) us_rep (ptr__content
                                                                    a))

(define-fun dynamic_invariant ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (not
                                     (= (rec__membership__ptr__is_null_pointer
                                        temp___expr_187) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__membership__ptr__pointer_value
                                     temp___expr_187))
                                     (last1
                                     (rec__membership__ptr__pointer_value
                                     temp___expr_187)))))

(define-fun default_initial_assumption ((temp___expr_189 us_rep)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__membership__ptr__is_null_pointer
                                            temp___expr_189) true))

(declare-sort tptr2P1 0)

(declare-fun tptr2P1qtint (tptr2P1) Int)

;; tptr2P1'axiom
  (assert
  (forall ((i tptr2P1))
  (and (<= 1 (tptr2P1qtint i)) (<= (tptr2P1qtint i) 5))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tptr2P1 tptr2P1) Bool)

(declare-const dummy5 tptr2P1)

(declare-datatypes ((tptr2P1__ref 0))
(((tptr2P1__refqtmk (tptr2P1__content tptr2P1)))))
(define-fun tptr2P1__ref_tptr2P1__content__projection ((a tptr2P1__ref)) tptr2P1 
  (tptr2P1__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__membership__ptr__is_null_pointer1 Bool)(rec__membership__ptr__pointer_address1 Int)(rec__membership__ptr__pointer_value1 (Array Int natural))))))
(define-fun us_rep_rec__membership__ptr__is_null_pointer__2__projection ((a us_rep1)) Bool 
  (rec__membership__ptr__is_null_pointer1 a))

(define-fun us_rep_rec__membership__ptr__pointer_address__2__projection ((a us_rep1)) Int 
  (rec__membership__ptr__pointer_address1 a))

(define-fun us_rep_rec__membership__ptr__pointer_value__2__projection ((a us_rep1)) (Array Int natural) 
  (rec__membership__ptr__pointer_value1 a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep1)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep1 
  (us_rep__content1 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__membership__ptr__is_null_pointer1 a) 
                         (rec__membership__ptr__is_null_pointer1 b))
                         (=>
                         (not
                         (= (rec__membership__ptr__is_null_pointer1 a) true))
                         (and
                         (= (rec__membership__ptr__pointer_address1 a) 
                         (rec__membership__ptr__pointer_address1 b))
                         (= (rec__membership__ptr__pointer_value1 a) 
                         (rec__membership__ptr__pointer_value1 b)))))
                    true false))

(define-fun rec__membership__ptr2__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__membership__ptr__is_null_pointer1 a) true)))

(declare-const us_null_pointer1 us_rep1)

;; __null_pointer__def_axiom
  (assert (= (rec__membership__ptr__is_null_pointer1 us_null_pointer1) true))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (rec__membership__ptr__is_null_pointer1
                                         a)
                                         (rec__membership__ptr__pointer_address1
                                         a)
                                         (of_array
                                         (rec__membership__ptr__pointer_value1
                                         a) 1 5)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (rec__membership__ptr__is_null_pointer
                                         r)
                                         (rec__membership__ptr__pointer_address
                                         r)
                                         (let ((temp___155 (rec__membership__ptr__pointer_value
                                                           r)))
                                         (to_array temp___155))))

(define-fun in_range5 ((first2 Int) (last2 Int)
  (r us_rep)) Bool (=>
                   (not (= (rec__membership__ptr__is_null_pointer r) true))
                   (and
                   (= (first1 (rec__membership__ptr__pointer_value r)) first2)
                   (= (last1 (rec__membership__ptr__pointer_value r)) last2))))

(declare-const dummy6 us_rep1)

(declare-datatypes ((ptr2__ref 0))
(((ptr2__refqtmk (ptr2__content us_rep1)))))
(define-fun ptr2__ref_ptr2__content__projection ((a ptr2__ref)) us_rep1 
  (ptr2__content a))

(define-fun default_initial_assumption1 ((temp___expr_196 us_rep1)
  (temp___skip_top_level_197 Bool)) Bool (= (rec__membership__ptr__is_null_pointer1
                                            temp___expr_196) true))

(declare-sort t5b 0)

(declare-fun t5bqtint (t5b) Int)

;; t5b'axiom
  (assert (forall ((i t5b)) (and (<= 1 (t5bqtint i)) (<= (t5bqtint i) 5))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t5b t5b) Bool)

(declare-const dummy7 t5b)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content t5b)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) t5b (t5b__content
                                                                 a))

(declare-sort t8b 0)

(declare-fun t8bqtint (t8b) Int)

;; t8b'axiom
  (assert (forall ((i t8b)) (and (<= 1 (t8bqtint i)) (<= (t8bqtint i) 6))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t8b t8b) Bool)

(declare-const dummy8 t8b)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content t8b)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) t8b (t8b__content
                                                                 a))

(declare-fun temp_____aggregate_def_198 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_202 (Int) (Array Int natural))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_181 us_t)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_181)
                                     (last1 temp___expr_181))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___200 Int))
  (=> (dynamic_invariant1 temp___200 true true true true)
  (forall ((temp___201 Int))
  (= (select (temp_____aggregate_def_198 temp___200) temp___201) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___204 Int))
  (=> (dynamic_invariant1 temp___204 true true true true)
  (forall ((temp___205 Int))
  (= (select (temp_____aggregate_def_202 temp___204) temp___205) rliteral)))))

(assert
;; defqtvc
 ;; File "membership.adb", line 1, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (o us_rep))
  (=>
  (= (and (ite (and (not (= (rec__membership__ptr__is_null_pointer o) true))
               (= (rec__membership__ptr__pointer_address o) us_next_pointer_address))
          true false) (ite (= (rec__membership__ptr__pointer_value o) 
                      (of_array (temp_____aggregate_def_198 0) 1 5)) true
                      false)) true)
  (let ((membership__x__assume (of_base o)))
  (forall ((x__pointer_value (Array Int natural)))
  (=>
  (= x__pointer_value (rec__membership__ptr__pointer_value1
                      membership__x__assume))
  (forall ((x__pointer_address Int))
  (=>
  (= x__pointer_address (rec__membership__ptr__pointer_address1
                        membership__x__assume))
  (forall ((x__is_null_pointer Bool))
  (=>
  (= x__is_null_pointer (rec__membership__ptr__is_null_pointer1
                        membership__x__assume))
  (forall ((us_next_pointer_address1 Int))
  (forall ((membership__y__assume us_rep))
  (=>
  (= (and (ite (and
               (not
               (= (rec__membership__ptr__is_null_pointer
                  membership__y__assume) true))
               (= (rec__membership__ptr__pointer_address
                  membership__y__assume) us_next_pointer_address1))
          true false) (ite (= (rec__membership__ptr__pointer_value
                              membership__y__assume) (of_array
                                                     (temp_____aggregate_def_202
                                                     0) 1 6))
                      true false)) true)
  (forall ((y__pointer_value us_t))
  (=>
  (= y__pointer_value (rec__membership__ptr__pointer_value
                      membership__y__assume))
  (forall ((y__pointer_address Int))
  (=>
  (= y__pointer_address (rec__membership__ptr__pointer_address
                        membership__y__assume))
  (forall ((y__is_null_pointer Bool))
  (=>
  (= y__is_null_pointer (rec__membership__ptr__is_null_pointer
                        membership__y__assume))
  (=> (dynamic_invariant
  (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value) true
  false true true) (in_range5 1 5
  (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value)))))))))))))))))))))))
(check-sat)
(exit)
