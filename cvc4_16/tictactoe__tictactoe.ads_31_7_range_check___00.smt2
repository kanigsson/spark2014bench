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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort slot 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (slot slot) Bool)

(declare-const dummy1 slot)

(declare-datatypes ((slot__ref 0))
(((slot__refqtmk (slot__content slot)))))
(define-fun slot__ref_slot__content__projection ((a slot__ref)) slot 
  (slot__content a))

(declare-fun to_rep (slot) Int)

(declare-fun of_rep (Int) slot)

;; inversion_axiom
  (assert
  (forall ((x slot)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x slot)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int slot))))))
(declare-fun slide ((Array Int slot) Int Int) (Array Int slot))

;; slide_eq
  (assert
  (forall ((a (Array Int slot)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int slot)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int slot)) (a__first Int) (a__last Int)
  (b (Array Int slot)) (b__first Int)
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
  (forall ((a (Array Int slot)) (b (Array Int slot)))
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

(declare-const dummy2 (Array Int slot))

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

(declare-fun user_eq2 ((Array Int slot) (Array Int slot)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int slot)))))))
(declare-fun slide1 ((Array Int (Array Int slot)) Int
  Int) (Array Int (Array Int slot)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int slot))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int slot))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int slot))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int slot))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 3
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 3) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int slot))) (b (Array Int (Array Int slot))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 3
     (select b (+ (- b__first a__first) temp___idx_155)) 1 3) true))))))))

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

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-fun one_free_slot (Int Int (Array Int (Array Int slot))) Int)

(declare-fun one_free_slot__function_guard (Int Int Int
  (Array Int (Array Int slot))) Bool)

(declare-fun count_free_slots (Int Int (Array Int (Array Int slot))) Int)

(declare-fun count_free_slots__function_guard (Int Int Int
  (Array Int (Array Int slot))) Bool)

(declare-sort pos 0)

(declare-fun posqtint (pos) Int)

;; pos'axiom
  (assert (forall ((i pos)) (and (<= 1 (posqtint i)) (<= (posqtint i) 3))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (pos pos) Bool)

(declare-const dummy4 pos)

(declare-datatypes ((pos__ref 0))
(((pos__refqtmk (pos__content pos)))))
(define-fun pos__ref_pos__content__projection ((a pos__ref)) pos (pos__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 1 3)) (in_range3 temp___expr_178)))

;; count_free_slots__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (forall ((tictactoe__my_board (Array Int (Array Int slot))))
  (! (=>
     (and (dynamic_invariant1 x true true true true) (dynamic_invariant1 y
     true true true true))
     (let ((result (count_free_slots x y tictactoe__my_board)))
     (=> (count_free_slots__function_guard result x y tictactoe__my_board)
     (dynamic_invariant result true false true true)))) :pattern ((count_free_slots
                                                                  x y
                                                                  tictactoe__my_board)) ))))

;; count_free_slots__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (forall ((tictactoe__my_board (Array Int (Array Int slot))))
  (! (=>
     (and (dynamic_invariant1 x true true true true) (dynamic_invariant1 y
     true true true true))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 1 1 tictactoe__my_board1)
     1 1 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 1 2 tictactoe__my_board1)
     1 2 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 1 3 tictactoe__my_board1)
     1 3 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 2 1 tictactoe__my_board1)
     2 1 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 2 2 tictactoe__my_board1)
     2 2 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 2 3 tictactoe__my_board1)
     2 3 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 3 1 tictactoe__my_board1)
     3 1 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 3 2 tictactoe__my_board1)
     3 2 tictactoe__my_board1))
     (and
     (forall ((tictactoe__my_board1 (Array Int (Array Int slot))))
     (one_free_slot__function_guard (one_free_slot 3 3 tictactoe__my_board1)
     3 3 tictactoe__my_board1))
     (= (count_free_slots x y tictactoe__my_board) (+ (+ (+ (+ (one_free_slot
                                                               1 1
                                                               tictactoe__my_board) 
     (ite (<= 2 y) (one_free_slot 1 2 tictactoe__my_board) 0)) (ite (<= 3 y)
                                                               (one_free_slot
                                                               1 3
                                                               tictactoe__my_board)
                                                               0)) (ite (<= 2 x)
                                                                   (+ (+ 
                                                                   (one_free_slot
                                                                   2 1
                                                                   tictactoe__my_board) 
                                                                   (ite (<= 2 y)
                                                                   (one_free_slot
                                                                   2 2
                                                                   tictactoe__my_board)
                                                                   0)) 
                                                                   (ite (<= 3 y)
                                                                   (one_free_slot
                                                                   2 3
                                                                   tictactoe__my_board)
                                                                   0)) 0)) 
     (ite (<= 3 x)
     (+ (+ (one_free_slot 3 1 tictactoe__my_board) (ite (<= 2 y)
                                                   (one_free_slot 3 2
                                                   tictactoe__my_board) 0)) 
     (ite (<= 3 y) (one_free_slot 3 3 tictactoe__my_board) 0)) 0))))))))))))) :pattern (
  (count_free_slots x y tictactoe__my_board)) ))))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 0 2)) (in_range1 temp___expr_171)))

;; one_free_slot__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (forall ((tictactoe__my_board (Array Int (Array Int slot))))
  (! (=>
     (and (dynamic_invariant1 x true true true true) (dynamic_invariant1 y
     true true true true))
     (let ((result (one_free_slot x y tictactoe__my_board)))
     (=> (one_free_slot__function_guard result x y tictactoe__my_board)
     (dynamic_invariant result true false true true)))) :pattern ((one_free_slot
                                                                  x y
                                                                  tictactoe__my_board)) ))))

;; one_free_slot__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (forall ((tictactoe__my_board (Array Int (Array Int slot))))
  (! (=>
     (and (dynamic_invariant1 x true true true true) (dynamic_invariant1 y
     true true true true))
     (= (one_free_slot x y tictactoe__my_board) (ite (= (to_rep
                                                        (let ((temp___209 (select tictactoe__my_board x)))
                                                        (select temp___209 y))) 0)
                                                1 0))) :pattern ((one_free_slot
                                                                 x y
                                                                 tictactoe__my_board)) ))))

(assert
;; defqtvc
 ;; File "tictactoe.ads", line 30, characters 0-0
  (not
  (forall ((my_board (Array Int (Array Int slot))))
  (let ((o (count_free_slots 3 3 my_board)))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 1 1 my_board1) 1 1
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 1 2 my_board1) 1 2
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 1 3 my_board1) 1 3
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 2 1 my_board1) 2 1
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 2 2 my_board1) 2 2
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 2 3 my_board1) 2 3
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 3 1 my_board1) 3 1
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 3 2 my_board1) 3 2
  my_board1))
  (=>
  (forall ((my_board1 (Array Int (Array Int slot))))
  (one_free_slot__function_guard (one_free_slot 3 3 my_board1) 3 3
  my_board1))
  (=>
  (and (count_free_slots__function_guard o 3 3 my_board)
  (and (dynamic_invariant o true false true true)
  (= o (+ (+ (+ (+ (one_free_slot 1 1 my_board) (ite (<= 2 3)
                                                (one_free_slot 1 2 my_board)
                                                0)) (ite (<= 3 3)
                                                    (one_free_slot 1 3
                                                    my_board) 0)) (ite (<= 2 3)
                                                                  (+ (+ 
                                                                  (one_free_slot
                                                                  2 1
                                                                  my_board) 
                                                                  (ite (<= 2 3)
                                                                  (one_free_slot
                                                                  2 2
                                                                  my_board)
                                                                  0)) 
                                                                  (ite (<= 3 3)
                                                                  (one_free_slot
                                                                  2 3
                                                                  my_board)
                                                                  0)) 0)) 
  (ite (<= 3 3)
  (+ (+ (one_free_slot 3 1 my_board) (ite (<= 2 3)
                                     (one_free_slot 3 2 my_board) 0)) 
  (ite (<= 3 3) (one_free_slot 3 3 my_board) 0)) 0))))) (in_range o)))))))))))))))
(check-sat)
(exit)
