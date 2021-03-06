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

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort cell 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (cell cell) Bool)

(declare-const dummy2 cell)

(declare-datatypes ((cell__ref 0))
(((cell__refqtmk (cell__content cell)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) cell 
  (cell__content a))

(declare-fun to_rep (cell) Int)

(declare-fun of_rep (Int) cell)

;; inversion_axiom
  (assert
  (forall ((x cell)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x cell)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int cell))))))
(declare-fun slide ((Array Int cell) Int Int) (Array Int cell))

;; slide_eq
  (assert
  (forall ((a (Array Int cell)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int cell)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int cell)) (a__first Int) (a__last Int)
  (b (Array Int cell)) (b__first Int)
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
  (forall ((a (Array Int cell)) (b (Array Int cell)))
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

(declare-const dummy3 (Array Int cell))

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

(declare-fun user_eq3 ((Array Int cell) (Array Int cell)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int cell)))))))
(declare-fun slide1 ((Array Int (Array Int cell)) Int
  Int) (Array Int (Array Int cell)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int cell))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int cell))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int cell))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int cell))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 10
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 10) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int cell))) (b (Array Int (Array Int cell))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 10
     (select b (+ (- b__first a__first) temp___idx_155)) 1 10) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_complete_line ((Array Int cell)) Bool)

(declare-fun is_complete_line__function_guard (Bool (Array Int cell)) Bool)

;; is_complete_line__post_axiom
  (assert true)

;; is_complete_line__def_axiom
  (assert
  (forall ((l (Array Int cell)))
  (! (= (= (is_complete_line l) true)
     (forall ((x Int))
     (=> (and (<= 1 x) (<= x 10)) (not (= (to_rep (select l x)) 0))))) :pattern (
  (is_complete_line l)) )))

(declare-fun is_empty_line ((Array Int cell)) Bool)

(declare-fun is_empty_line__function_guard (Bool (Array Int cell)) Bool)

;; is_empty_line__post_axiom
  (assert true)

;; is_empty_line__def_axiom
  (assert
  (forall ((l (Array Int cell)))
  (! (= (= (is_empty_line l) true)
     (forall ((x Int))
     (=> (and (<= 1 x) (<= x 10)) (= (to_rep (select l x)) 0)))) :pattern (
  (is_empty_line l)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const empty_line (Array Int cell))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r3b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort y_coord 0)

(declare-fun y_coordqtint (y_coord) Int)

;; y_coord'axiom
  (assert
  (forall ((i y_coord))
  (and (<= 1 (y_coordqtint i)) (<= (y_coordqtint i) 50))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 50)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (y_coord y_coord) Bool)

(declare-const dummy4 y_coord)

(declare-datatypes ((y_coord__ref 0))
(((y_coord__refqtmk (y_coord__content y_coord)))))
(define-fun y_coord__ref_y_coord__content__projection ((a y_coord__ref)) y_coord 
  (y_coord__content a))

(define-fun dynamic_invariant2 ((temp___expr_574 Int)
  (temp___is_init_570 Bool) (temp___skip_constant_571 Bool)
  (temp___do_toplevel_572 Bool)
  (temp___do_typ_inv_573 Bool)) Bool (=>
                                     (or (= temp___is_init_570 true)
                                     (<= 1 50)) (in_range4 temp___expr_574)))

(declare-fun tetris_integrity__delete_complete_lines__empty_line__aggregate_def (Int) (Array Int cell))

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

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content integer)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) integer 
  (t4b__content a))

;; empty_line__def_axiom
  (assert
  (= empty_line (tetris_integrity__delete_complete_lines__empty_line__aggregate_def
                0)))

(define-fun dynamic_invariant3 ((temp___expr_546 Int)
  (temp___is_init_542 Bool) (temp___skip_constant_543 Bool)
  (temp___do_toplevel_544 Bool)
  (temp___do_typ_inv_545 Bool)) Bool (=>
                                     (or (= temp___is_init_542 true)
                                     (<= 0 7)) (in_range3 temp___expr_546)))

;; def_axiom
  (assert
  (forall ((temp___540 Int))
  (=> (dynamic_invariant3 temp___540 true true true true)
  (forall ((temp___541 Int))
  (= (to_rep
     (select (tetris_integrity__delete_complete_lines__empty_line__aggregate_def
             temp___540) temp___541)) temp___540)))))

(assert
;; defqtvc
 ;; File "tetris_integrity.ads", line 208, characters 0-0
  (not
  (forall ((spark__branch Bool) (cur_board (Array Int (Array Int cell)))
  (num_deleted Int) (to_line Int) (has_complete_lines Bool)
  (spark__branch1 Bool) (cur_board1 (Array Int (Array Int cell)))
  (to_line1 Int) (has_complete_lines1 Bool) (num_deleted1 Int)
  (spark__branch2 Bool))
  (=> (dynamic_invariant num_deleted false false true true)
  (=>
  (= (tetris_integrity__delete_complete_lines__empty_line__aggregate_def 0) 
  empty_line)
  (=> (= to_line 50)
  (=> (dynamic_invariant2 to_line true false true true)
  (=> (= has_complete_lines (distinct 0 0))
  (=>
  (exists ((del_line Int))
  (and (= del_line 1)
  (ite (= (and (ite (<= 1 del_line) true false) (ite (<= del_line 50) true
                                                false)) true)
  (exists ((cur_board2 (Array Int (Array Int cell))) (to_line2 Int)
  (has_complete_lines2 Bool) (del_line1 Int))
  (and
  (= (and (ite (and (dynamic_invariant2 to_line2 true true true true)
               (forall ((temp___864 Int))
               (=> (and (<= 1 temp___864) (<= temp___864 50))
               (=>
               (or (< 50 temp___864)
               (or (< temp___864 1) (<= del_line1 temp___864)))
               (= (select cur_board2 temp___864) (select cur_board temp___864))))))
          true false) (ite (and (<= 1 del_line1) (<= del_line1 50)) true
                      false)) true)
  (and
  (let ((o (select cur_board2 del_line1)))
  (let ((o1 (is_complete_line o)))
  (and
  (and (is_complete_line__function_guard o1 o)
  (= (= o1 true)
  (forall ((x Int))
  (=> (and (<= 1 x) (<= x 10)) (not (= (to_rep (select o x)) 0))))))
  (and (= spark__branch1 o1)
  (ite (= spark__branch1 true)
  (and (= cur_board1 (store cur_board2 del_line1 empty_line))
  (and (= has_complete_lines1 (distinct 1 0)) (= to_line1 del_line1)))
  (and (and (= cur_board1 cur_board2) (= to_line1 to_line2))
  (= has_complete_lines1 has_complete_lines2))))))) (= del_line1 50))))
  (and
  (and (and (= spark__branch1 spark__branch) (= cur_board1 cur_board))
  (= to_line1 to_line)) (= has_complete_lines1 has_complete_lines)))))
  (=> (= spark__branch2 has_complete_lines1)
  (=> (= num_deleted1 0)
  (=> (= spark__branch2 true)
  (=> (= (- to_line1 1) r3b)
  (=> (dynamic_invariant1 r3b true false true true)
  (let ((temp___867 r3b))
  (forall ((from_line Int))
  (=> (= from_line temp___867)
  (=>
  (= (and (ite (<= 1 from_line) true false) (ite (<= from_line temp___867)
                                            true false)) true)
  (forall ((temp___loop_entry_875 Int))
  (=> (= temp___loop_entry_875 to_line1)
  (forall ((temp___loop_entry_874 Int))
  (=> (= temp___loop_entry_874 num_deleted1)
  (forall ((cur_board2 (Array Int (Array Int cell))) (num_deleted2 Int)
  (to_line2 Int) (from_line1 Int))
  (=>
  (and (< from_line1 to_line2)
  (= (+ num_deleted2 to_line2) (+ temp___loop_entry_874 temp___loop_entry_875)))
  (=>
  (= (and (ite (and
               (and (dynamic_invariant2 to_line2 true true true true)
               (dynamic_invariant num_deleted2 false true true true))
               (dynamic_property 1 r3b from_line1))
          true false) (ite (and (<= 1 from_line1) (<= from_line1 r3b)) true
                      false)) true)
  (forall ((num_deleted3 Int) (to_line3 Int))
  (=>
  (let ((o (select cur_board2 from_line1)))
  (let ((o1 (is_empty_line o)))
  (and
  (and (is_empty_line__function_guard o1 o)
  (= (= o1 true)
  (forall ((x Int))
  (=> (and (<= 1 x) (<= x 10)) (= (to_rep (select o x)) 0)))))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= o1 true) false true))
  (ite (= spark__branch3 true)
  (exists ((cur_board3 (Array Int (Array Int cell))))
  (and
  (= cur_board3 (store cur_board2 to_line2 (select cur_board2 from_line1)))
  (let ((o2 (- to_line2 1)))
  (and (in_range4 o2)
  (and (= to_line3 o2)
  (let ((o3 (+ num_deleted2 1))) (and (in_range1 o3) (= num_deleted3 o3))))))))
  (and (= num_deleted3 num_deleted2) (= to_line3 to_line2))))))))
  (=> (not (= from_line1 1))
  (forall ((from_line2 Int))
  (=> (= from_line2 (- from_line1 1)) (< from_line2 to_line3)))))))))))))))))))))))))))))))
(check-sat)
(exit)
