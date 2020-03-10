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

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-const dummy t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun to_rep ((x t)) Int (tqtint x))

(declare-fun of_rep (Int) t)

;; inversion_axiom
  (assert
  (forall ((x t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert (forall ((x t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__pointers__t_ptr__is_null_pointer Bool)(rec__pointers__t_ptr__pointer_address Int)(rec__pointers__t_ptr__pointer_value t)))))
(define-fun us_rep_rec__pointers__t_ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__pointers__t_ptr__is_null_pointer a))

(define-fun us_rep_rec__pointers__t_ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__pointers__t_ptr__pointer_address a))

(define-fun us_rep_rec__pointers__t_ptr__pointer_value__projection ((a us_rep)) t 
  (rec__pointers__t_ptr__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__pointers__t_ptr__is_null_pointer a) 
                        (rec__pointers__t_ptr__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__pointers__t_ptr__is_null_pointer a) true))
                        (and
                        (= (rec__pointers__t_ptr__pointer_address a) 
                        (rec__pointers__t_ptr__pointer_address b))
                        (= (rec__pointers__t_ptr__pointer_value a) (rec__pointers__t_ptr__pointer_value
                                                                   b)))))
                   true false))

(define-fun rec__pointers__t_ptr__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__pointers__t_ptr__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__pointers__t_ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((t_ptr__ref 0))
(((t_ptr__refqtmk (t_ptr__content us_rep)))))
(define-fun t_ptr__ref_t_ptr__content__projection ((a t_ptr__ref)) us_rep 
  (t_ptr__content a))

(define-fun default_initial_assumption ((temp___expr_168 us_rep)
  (temp___skip_top_level_169 Bool)) Bool (= (rec__pointers__t_ptr__is_null_pointer
                                            temp___expr_168) true))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const i7s (Array Int us_rep))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i1 index)) (and (<= 1 (indexqtint i1)) (<= (indexqtint i1) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= 1 10)) (in_range2 temp___expr_174)))

(define-fun dynamic_invariant1 ((temp___expr_181 (Array Int us_rep))
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=> (= temp___do_toplevel_179 true)
                                     (forall ((k Int))
                                     (=> (and (<= 1 k) (<= k 10))
                                     (not
                                     (= (bool_eq (select temp___expr_181 k)
                                        us_null_pointer) true))))))

(define-fun default_initial_assumption1 ((temp___expr_184 (Array Int us_rep))
  (temp___skip_top_level_185 Bool)) Bool (forall ((temp___186 Int))
                                         (=>
                                         (and (<= 1 temp___186)
                                         (<= temp___186 10))
                                         (= (rec__pointers__t_ptr__is_null_pointer
                                            (select temp___expr_184 temp___186)) true))))

(define-fun dynamic_predicate ((temp___188 (Array Int us_rep))) Bool 
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k 10))
  (not (= (bool_eq (select temp___188 k) us_null_pointer) true)))))

(define-fun dynamic_invariant2 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_160)))

(assert
;; defqtvc
 ;; File "pointers.ads", line 15, characters 0-0
  (not
  (forall ((a (Array Int us_rep)) (us_next_pointer_address Int)
  (pointers__swap__2__tmp__assume us_rep) (tmp__pointer_value t)
  (tmp__pointer_address Int) (tmp__is_null_pointer Bool))
  (=> (dynamic_invariant1 i7s true false true true)
  (=> (dynamic_invariant1 i7s true false true true)
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant i true false true true)
  (=> (dynamic_invariant j true false true true)
  (=> (not (= i j))
  (=>
  (= (and (ite (and
               (not
               (= (rec__pointers__t_ptr__is_null_pointer
                  pointers__swap__2__tmp__assume) true))
               (= (rec__pointers__t_ptr__pointer_address
                  pointers__swap__2__tmp__assume) us_next_pointer_address))
          true false) (ite (= (rec__pointers__t_ptr__pointer_value
                              pointers__swap__2__tmp__assume) (of_rep 0))
                      true false)) true)
  (=>
  (= tmp__pointer_value (rec__pointers__t_ptr__pointer_value
                        pointers__swap__2__tmp__assume))
  (=>
  (= tmp__pointer_address (rec__pointers__t_ptr__pointer_address
                          pointers__swap__2__tmp__assume))
  (=>
  (= tmp__is_null_pointer (rec__pointers__t_ptr__is_null_pointer
                          pointers__swap__2__tmp__assume))
  (let ((pointers__swap__x__compl (select a i)))
  (forall ((tmp__pointer_value1 t) (pointers__swap__x__value t))
  (=>
  (and (= (to_rep pointers__swap__x__value) (to_rep tmp__pointer_value))
  (= (to_rep tmp__pointer_value1) (to_rep
                                  (rec__pointers__t_ptr__pointer_value
                                  pointers__swap__x__compl))))
  (let ((temp___200 (store a i (us_repqtmk
                               (rec__pointers__t_ptr__is_null_pointer
                               pointers__swap__x__compl)
                               (rec__pointers__t_ptr__pointer_address
                               pointers__swap__x__compl)
                               pointers__swap__x__value))))
  (=> (dynamic_predicate temp___200)
  (forall ((a1 (Array Int us_rep)))
  (=> (= a1 temp___200)
  (let ((pointers__swap__x__compl1 (select a1 j)))
  (forall ((tmp__pointer_value2 t) (pointers__swap__x__value1 t))
  (=>
  (and (= (to_rep pointers__swap__x__value1) (to_rep tmp__pointer_value1))
  (= (to_rep tmp__pointer_value2) (to_rep
                                  (rec__pointers__t_ptr__pointer_value
                                  pointers__swap__x__compl1))))
  (let ((temp___201 (store a1 j (us_repqtmk
                                (rec__pointers__t_ptr__is_null_pointer
                                pointers__swap__x__compl1)
                                (rec__pointers__t_ptr__pointer_address
                                pointers__swap__x__compl1)
                                pointers__swap__x__value1))))
  (=> (dynamic_predicate temp___201)
  (forall ((a2 (Array Int us_rep)))
  (=> (= a2 temp___201)
  (let ((pointers__swap__x__compl2 (select a2 i)))
  (forall ((tmp__pointer_value3 t) (pointers__swap__x__value2 t))
  (=>
  (and (= (to_rep pointers__swap__x__value2) (to_rep tmp__pointer_value2))
  (= (to_rep tmp__pointer_value3) (to_rep
                                  (rec__pointers__t_ptr__pointer_value
                                  pointers__swap__x__compl2))))
  (let ((temp___202 (store a2 i (us_repqtmk
                                (rec__pointers__t_ptr__is_null_pointer
                                pointers__swap__x__compl2)
                                (rec__pointers__t_ptr__pointer_address
                                pointers__swap__x__compl2)
                                pointers__swap__x__value2))))
  (=> (dynamic_predicate temp___202)
  (forall ((a3 (Array Int us_rep)))
  (=> (= a3 temp___202) (rec__pointers__t_ptr__pointer_value__pred
  (select a3 j))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
